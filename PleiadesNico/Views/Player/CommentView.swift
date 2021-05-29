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
            screen  : screen,
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

    let dispSec         = 4.0

    var isPlaying       = false
    var activeChats     = [ChatLabel]()
    var fontSize        = 10
    var strokeSize      = 1
    var yCoords         = [CGFloat]()
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

        self.commentTimer = Timer.publish(every: 0.1, on: .main, in: .default)
            .autoconnect()
            .sink(receiveValue: { date in
                    self.tick()
                }
            )

        guard let viewModel = self.viewModel
        else {
            print("ERROR! comment is not available")
            return
        }

        self.fontSize      = viewModel.commentFontSize
        self.strokeSize    = viewModel.commentStrokeSize
        
        let chatHeight    = CGFloat(self.fontSize)
        let heightMargin  = chatHeight * 2.0
        let screenHeight  = self.view.bounds.height - heightMargin
        let rawLaneNum    = (Int(screenHeight) / fontSize)

        self.yCoords = []
        
        let primaryStartY = CGFloat(self.fontSize)
        for primaryLane in 0..<rawLaneNum {
            self.yCoords.append( primaryStartY   + ( chatHeight * CGFloat(primaryLane) ) )
        }

        let secondaryStartY = CGFloat(self.fontSize) * 1.5
        for secondaryLane in 0..<rawLaneNum {
            self.yCoords.append( secondaryStartY + ( chatHeight * CGFloat(secondaryLane) ) )
        }
    }


    func tick(){

        guard let viewModel = self.viewModel
        else {
            print("ERROR! comment is not available")
            return
        }

        let isVideoPaused : Bool = viewModel.elapsedTime == self.lastElapsedTime
        
        // Pause -> Play
        if !self.isPlaying && !isVideoPaused{
            for chat in self.activeChats {
                chat.resume()
            }
            isPlaying = true
        }

        // Play -> Pause
        if self.isPlaying && isVideoPaused{
            for chat in self.activeChats {
                chat.pause()
            }
            isPlaying = false
        }
        
        if !isPlaying {
            return
        }

        // First time after seek
        if abs( viewModel.elapsedTime - self.lastElapsedTime ) > 1.0 {
            for chat in self.activeChats {
                chat.removeFromSuperview()
            }
            self.activeChats  = []
            self.commentIndex = 0
        }

        let comments         = viewModel.comments()
        let time             = viewModel.elapsedTime
        self.lastElapsedTime = time

        for index in self.commentIndex..<comments.count {

            let comment = comments[index]

            // Future comment
            if time < comment.sec {
                break
            }

            self.commentIndex += 1
            
            // Expired comment
            if time > comment.sec + self.dispSec {
                continue
            }
            
            // Number of comment on the screen exceeds the limit
            if self.activeChats.count >= viewModel.commentMaxDispNum {
                let chat = self.activeChats[0]
                chat.removeFromSuperview()
                self.activeChats.remove(at: 0)
            }

            // Estimate X coordinates and duration
            let textWidth  = self.fontSize * comment.body.count
            let duration   = (comment.sec + self.dispSec) - time
            let elapseRate = (self.dispSec - duration) / self.dispSec
            let origX      = self.view.bounds.width + (CGFloat(textWidth) / 2.0)
            let endX       = (CGFloat(textWidth) / 2.0) * -1.0
            let startX     = origX + ((endX - origX) * CGFloat(elapseRate))

            // Estimate Y coordinate
            let lane       = comment.index % self.yCoords.count
            let startY     = self.yCoords[lane]

            let label = instantiateLabel(
                comment  : comment,
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

            self.activeChats.append(label)
        }
    }


    func instantiateLabel(comment : StreamConnection.Comment, textWidth : Int, xPos : CGFloat, yPos : CGFloat) -> ChatLabel{

        let chatLabel = ChatLabel(
            frame: CGRect(x: 0,y: 0,width: textWidth, height: self.fontSize)
        )
        chatLabel.text           = comment.body
        chatLabel.textColor      = UIColor.white
        chatLabel.textAlignment  = NSTextAlignment.center
        chatLabel.font           = UIFont.boldSystemFont(ofSize: CGFloat(self.fontSize))
        chatLabel.layer.position = CGPoint( x : xPos, y: yPos )
        chatLabel.strokeSize     = CGFloat( self.strokeSize )
        chatLabel.index          = comment.index

        return chatLabel
    }


    func animateLabel(label: ChatLabel, endX : CGFloat, duration : Double, index: Int){

        UIView.animate(
            withDuration: duration,
            delay: 0.0,
            options: [.curveLinear],
            animations: {() -> Void in
                label.center.x = endX
            },
            completion: {(Bool) -> Void in
                if let loc = self.activeChats.firstIndex(of: label) {
                    self.activeChats.remove(at: loc)
                }
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

    var index       : Int     = 0
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
