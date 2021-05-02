//
//  CommentView.swift
//  XML_Sample
//
//  Created by katot on 2021/04/25.
//

import SwiftUI
import Combine


// MARK: -  View
struct CommentView: View {
    
    @ObservedObject var viewModel: PlayerViewModel
    
    var body: some View {
        CommentViewControllerRepresentable(
            viewModel: viewModel
        )
    }
}

// MARK: -  Preview
struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        let screen    = VideoScreen()
        let viewModel = PlayerViewModel(
            avScreen  : screen,
            contentId : "sm1192"
        )

        CommentView(viewModel: viewModel)
    }
}


// MARK: -  Representable
struct CommentViewControllerRepresentable : UIViewControllerRepresentable {

    let viewModel: PlayerViewModel
    
    func makeUIViewController(context: Context) -> UIViewController {
        return CommentViewController( viewModel: viewModel )
    }
    
    func updateUIViewController(_ uiViewController:UIViewController, context: Context) {
    }
}


// MARK: - ViewController
class CommentViewController: UIViewController {

    private var commentTimer : Cancellable?

    var activeChats     = [ Int : ChatLabel]()
    let fontSize        = 20
    let dispSec         = 4.0
    var isPlaying       = false
    let laneNum         = 16
    var laneHeight      = CGFloat(0)
    var firstLaneY      = CGFloat(0)
    var commentIndex    = 0
    var lastElapsedTime = 0.0

    let viewModel: PlayerViewModel?
    

    init(viewModel : PlayerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }


    required init?(coder aDecoder: NSCoder) {
        self.viewModel = nil
        super.init(coder: aDecoder)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        /*
         * 0.1秒ごとにsearchComments実行
         */
        self.commentTimer = Timer.publish(every: 0.1, on: .main, in: .default)
            .autoconnect()
            .sink(receiveValue: { date in
                    self.searchComments()
                }
            )

        self.firstLaneY    = CGFloat(self.fontSize)
        let commentsHeight = self.view.bounds.height - ( CGFloat(self.fontSize) * 2.0 )
        self.laneHeight = commentsHeight / CGFloat(self.laneNum)
    }

    /*
     * そのときの秒数にテキストが存在すればラベルを生成しアニメーション付加
     */
    func searchComments(){

        guard let viewModel = self.viewModel
        else {
            print("ERROR! comment is not available")
            return
        }

        // Pause -> Play
        if viewModel.isPlaying && !self.isPlaying{
            for chat in self.activeChats.values {
                chat.resume()
            }
            isPlaying = true
        }

        // Play -> Pause
        if !viewModel.isPlaying && self.isPlaying{
            for chat in self.activeChats.values {
                chat.pause()
            }
            isPlaying = false
        }
        
        if !isPlaying {
            return
        }

        // First time after seek
        if abs( viewModel.elapsedTime - self.lastElapsedTime ) > 1.0 {
            for chat in self.activeChats.values {
                chat.removeFromSuperview()
            }
            self.activeChats  = [:]
            self.commentIndex = 0
        }

        let comments         = viewModel.comments
        let time             = viewModel.elapsedTime
        self.lastElapsedTime = time

        for index in self.commentIndex..<comments.count {

            let comment = comments[index]
            let lane     = comment.index % laneNum

            // Future comment
            if time < comment.sec {
                break
            }

            self.commentIndex += 1
            
            // Expired comment
            if time > comment.sec + self.dispSec {
                continue
            }
            
            let textWidth  = self.fontSize * comment.body.count
            let duration   = (comment.sec + self.dispSec) - time
            let elapseRate = (self.dispSec - duration) / self.dispSec
            let origX  = self.view.bounds.width + (CGFloat(textWidth) / 2.0)
            let endX   = (CGFloat(textWidth) / 2.0) * -1.0
            let startX = origX + ((endX - origX) * CGFloat(elapseRate))
            let startY  = self.firstLaneY + ( self.laneHeight * CGFloat(lane) )

//            print("timer:", time, "comment:", comment, "duration:", duration, "rate:", elapseRate)
            
            let label = instantiateLabel(
                text: comment.body,
                textWidth: textWidth,
                xPos: startX,
                yPos: startY
            )
            self.view.addSubview(label)
            
            animateLabel(
                label: label,
                endX: endX,
                duration: duration,
                index: comment.index
            )

            activeChats[comment.index] = label
        }
    }

    /*
     * テキストラベルの生成。引数はテキストラベルのストリングと生成する列
     */
    func instantiateLabel(text: String, textWidth : Int, xPos : CGFloat, yPos : CGFloat) -> ChatLabel{

        let chatLabel = ChatLabel(
            frame: CGRect(x: 0,y: 0,width: textWidth, height: fontSize)
        )
        chatLabel.text           = text
        chatLabel.textColor      = UIColor.white
        chatLabel.textAlignment  = NSTextAlignment.center
        chatLabel.layer.position = CGPoint( x : xPos, y: yPos )

        return chatLabel
    }

    func animateLabel(label: UILabel, endX : CGFloat, duration : Double, index: Int){

        UIView.animate(
            withDuration: duration,
            delay: 0.0,
            options: [.curveLinear],
            animations: {() -> Void in
                label.center.x = endX
            },
            completion: {(Bool) -> Void in
                self.activeChats[index] = nil
                label.removeFromSuperview()
            }
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - ChatLabel
class ChatLabel: UILabel {

    var strokeColor : UIColor = UIColor.black
    var strokeSize  : CGFloat = 1.0
    var isPaused    : Bool    = false
    
    override func drawText(in rect: CGRect) {
        if let context = UIGraphicsGetCurrentContext() {
            let textColor = self.textColor

            context.setLineWidth(self.strokeSize)
            context.setLineJoin(CGLineJoin.round)
            context.setTextDrawingMode(.stroke)
            self.textColor = self.strokeColor
            super.drawText(in: rect)

            context.setTextDrawingMode(.fill)
            self.textColor = textColor
        }
        super.drawText(in: rect)
    }


    func pause() {
        if isPaused {
            return
        }

        let pausedTime: CFTimeInterval = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0.0
        layer.timeOffset = pausedTime
        
        isPaused = true
    }


    func resume() {
        if !isPaused {
            return
        }
        
        let pausedTime     = layer.timeOffset
        layer.speed        = 1.0
        layer.timeOffset   = 0.0
        layer.beginTime    = 0.0
        let timeSincePause = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        layer.beginTime = timeSincePause

        isPaused = false
    }
}
