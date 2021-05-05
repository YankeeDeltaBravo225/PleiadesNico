//
//  AVControlViewModel.swift
//  TestBed
//
//  Created by katot on 2021/03/27.
//

import Foundation
import Combine

// MARK: - View Model

final class PlayerViewModel: ObservableObject {

    @Published var isPlaying   = false
    @Published var showControl = false
    @Published var showAlert   = false
    @Published var showPlayer  = false

    @Published var elapsedTimeText : String = "--:--"
    @Published var remainTimeText  : String = "--:--"
    @Published var currentTimeText : String = ""
    @Published var progressTexts   : [String] = []
    @Published var timeSliderPos   : Double = 0.0
    @Published var commentFontSize : Int
    
    private    var errorCount      : Int  = 0
    private    var prevElapsedTime : Int  = -1
    private    var isSeeking       : Bool = false
    private    var isReady         : Bool = false
    private    var controlFadeTime : Double = -1.0
    private    var doesControlFade : Bool   = false
    
    private    let videoId         : String
    private    let screen          : VideoScreen
    private    var timer           : Cancellable?
    private    let session         = NicoSession()

    private var connectState       : ConnectState = .getVideoPage
    private var stream             : StreamAPI
    private var heartBeatCount     : Int    = 0

    public  var elapsedTime        : Double    = 0.0
    public  var comments           : [Comment] = []

    struct Comment {
        let index : Int
        let sec   : Double
        let body  : String
    }
    

    init(screen : VideoScreen, contentId : String) {
        self.screen          = screen
        self.videoId         = contentId
        self.commentFontSize = ConfigStorage.shared.commentFontSize
        
        self.stream  = StreamAPI(contentId)
    }

    
    func onScreenTapp(){
        showControl.toggle()
    }


    func onAppear(){
        self.timer = Timer.publish(every: 0.1, on: .main, in: .default)
            .autoconnect()
            .sink(receiveValue: { date in
                    self.onTimerTick()
                    self.advanceConnection()
                }
            )
    }


    func onDisappear(){
        DebugLog.shared.debug("disappear:\(videoId)")
        timer?.cancel()
    }


    func onClose(){
        DebugLog.shared.debug("close:\(videoId)")
        timer?.cancel()
        self.screen.pause()
        self.screen.disappear()
    }
    
    
    func onPlay(){
        if !isReady {
            return
        }
        
        isPlaying   = true
        restartControlFade()
    }


    func onPause(){
        isPlaying   = false
        showControl = true
    }
 
    
    func togglePlay(){
        if isPlaying {
            screen.pause()
            onPause()
        } else {
            screen.play()
            onPlay()
        }
    }


    func onError(){
        if errorCount == 0 {
            showAlert = true
            timer?.cancel()
        }
        errorCount += 1
    }


    func onSwipeLeft(){
        screen.seek(deltaSec : -5)
        
        showControl = true
        restartControlFade()
    }


    func onSwipeRight(){
        screen.seek(deltaSec : +5)

        showControl = true
        restartControlFade()
    }


    func onSwipeUp(){
        
    }

    
    func onSwipeDown(){
        
    }


    func onTimerTick(){
        if screen.failed() {
            onError()
        }
        
        if isPlaying && showControl {
            countDownControlFade()
        }

        if !isSeeking {
            updateTime()
        }
    }


    func onTimeSliderChange(start : Bool){
        screen.seek(rate : timeSliderPos)
        isSeeking = start
    }

    
    func countDownControlFade(){
        if !doesControlFade {
            return
        }
        
        controlFadeTime -= 0.1

        if controlFadeTime < 0.0 {
            showControl     = false
            doesControlFade = false
        }
    }


    func restartControlFade(){
        controlFadeTime = Double(ConfigStorage.shared.controlFadeTime)
        doesControlFade = true
    }
    
    
    func updateTime(){
        let duration = screen.duration
        if duration == 0.0 {
            return
        }

        let elapsedTime   = screen.elapsedTime()
        let remainingTime = screen.remainTime()
        let intElapsedTime = Int(elapsedTime)

        if intElapsedTime != prevElapsedTime {
            elapsedTimeText = DateTimeFormat.shared.time( elapsedTime,   duration )
            remainTimeText  = DateTimeFormat.shared.time( remainingTime, duration )

            prevElapsedTime = intElapsedTime
        }
        
        if duration != 0 {
            timeSliderPos = elapsedTime / duration
        }
        
        if remainingTime == 0.0 {
            onPause()
        }

        self.elapsedTime     = elapsedTime
        self.currentTimeText = DateTimeFormat.shared.currentTime()
    }
    
}


// todo make this an indivisual class
extension PlayerViewModel {

    enum ConnectState: String, CaseIterable {
        case getVideoPage
        case waitVideoPage
        case postDmcReq
        case waitDmcResp
        case postCommentReq
        case waitCommentResp
        case initiateHeartBeat
        case postHeartBeat
        case waitHeartBeat
        case error
    }


    func advanceConnection(){

        switch(connectState){
        case .getVideoPage:
            startGetVideoPage()
        case .waitVideoPage:
            break
        case .postDmcReq:
            startDmcRequest()
            break
        case .waitDmcResp:
            break
        case .postCommentReq:
            startCommentRequest()
        case .waitCommentResp:
            break
        case .initiateHeartBeat:
            initiateHeartBeat()
        case .postHeartBeat:
            startHeartBeat()
        case .waitHeartBeat:
            break
        case .error:
            break
        }
    }


    func startGetVideoPage(){
        self.progressTexts.append("Loading video page")

        session.get(
            urlText    : stream.videoPageUrl(),
            onReceived : {text in
                self.onReceiveVideoPage(videoPage: text)
            },
            onError: { error in
                self.onError(error)
            }
        )
        
        self.connectState = .waitVideoPage
    }


    func onReceiveVideoPage(videoPage : String){
        self.progressTexts.append("Video page received")
        self.progressTexts.append("Parsing DMC API data")
        
        guard let dmcApiText = stream.extractDmcApiText( videoPage )
        else {
            onError("DMC Api string extracting failed")
            return
        }

        let state = stream.storeDmcSessionInfo( dmcApiText )
        if state != .success {
            onError("Failed to parse DMC Api string")
            DebugLog.shared.error("dmcApiText: \(dmcApiText)")
            return
        }

        self.connectState = .postCommentReq
    }

    
    func startCommentRequest() {
        guard let commentReq = stream.createCommentReq()
        else {
            onError("Failed to Create comment request")
            return
        }

        DebugLog.shared.error("commentReqUrl:\(stream.commentRequestUrl())")
        
        session.post(
            urlText    : stream.commentRequestUrl(),
            data       : commentReq,
            contentType: .textPlain,
            onReceived : {text in
                self.onReceiveCommentResponse(responseText : text)
            },
            onError: { error in
                self.onError(error)
            }
        )

        self.connectState   = .waitCommentResp
    }


    func onReceiveCommentResponse(responseText : String){
        self.progressTexts.append("Comments received")

        DebugLog.shared.debug("< Comments received >")
        DebugLog.shared.debug(responseText)

        let state = stream.storeCommentResponse(responseText)
        if state != .success {
            onError("Failed to parse Comment response:")
            DebugLog.shared.error(responseText)
            return
        }
        
        let vposScale = stream.commentTimeScale()
        self.comments = stream.comments().enumerated().map{
            Comment(
                index: $0.offset,
                sec  : Double($0.element.vpos ?? 0xFFFFFFFF) / vposScale,
                body : $0.element.content ?? ""
            )
        }
        
//        print(self.comments)
        
        self.connectState   = .postDmcReq
    }


    func startDmcRequest(){

        self.progressTexts.append("Creating DMC API request")
        
        guard let dmcReq = stream.createDmcSessionReq()
        else {
            onError("Failed to create DMC session request")
            return
        }

        session.post(
            urlText    : stream.dmcRequestUrl(),
            data       : dmcReq,
            contentType: .none,
            onReceived : {text in
                self.onReceiveDmcResponse(responseText : text)
            },
            onError: { error in
                self.onError(error)
            }
        )

        self.connectState = .waitDmcResp
    }


    func onReceiveDmcResponse(responseText : String){
        self.progressTexts.append("DMC API response received")

        let state = stream.storeDmcSessionResponse(responseText )
        if state != .success {
            DebugLog.shared.error("dmcResponse : \(responseText)")
            onError("Failed to parse DMC Response")
            return
        }

        let contentUri = stream.contentUri()
        guard let streamUrl = URL(string: contentUri )
        else {
            onError("Failed to parse content URI")
            return
        }
        
        self.progressTexts.append("Stream is ready")
        
        screen.loadUrl(
            streamUrl: streamUrl,
            handler: {
                self.screen.play()
                self.onPlay()
            }
        )
        self.showPlayer   = true
        self.showControl  = true
        self.isReady      = true

        self.connectState = .initiateHeartBeat
    }


    func initiateHeartBeat(){
        DebugLog.shared.debug("[initiateHeartBeat]")
        
        session.option(
            urlText    : stream.heartBeatUrl(),
            onReceived : {text in
                self.onHeartBeatResponse(responseText : text)
            },
            onError: { error in
                self.onError(error)
            }
        )

        self.connectState   = .waitHeartBeat
    }
    
    
    func startHeartBeat(){

        self.heartBeatCount += 1
        if self.heartBeatCount < 300{
            return
        }

        DebugLog.shared.debug("[startHeartBeat] count:\(self.heartBeatCount)")
        self.heartBeatCount = 0

        guard let heartBeatReq = stream.createHeartBeatRequest()
        else {
            onError("Failed to create Heart beat request")
            return
        }

        DebugLog.shared.debug("<heartBeatReq>")
        DebugLog.shared.debug(String(data: heartBeatReq, encoding: .utf8)!)

        session.post(
            urlText    : stream.heartBeatUrl(),
            data       : heartBeatReq,
            contentType: .none,
            onReceived : {text in
                self.onHeartBeatResponse(responseText : text)
            },
            onError: { error in
                self.onError(error)
            }
        )

        self.connectState   = .waitHeartBeat
    }


    func onHeartBeatResponse(responseText : String){
        DebugLog.shared.debug("[onHeartBeat response]")
        DebugLog.shared.debug(responseText)

        self.heartBeatCount = 0
        self.connectState   = .postHeartBeat
    }
    

    func onError(_ message : String){
        DebugLog.shared.error(message)
        DebugLog.shared.error(session.errLog)
        self.progressTexts.append(message)
        self.progressTexts.append("エラー報告の際はこちらのスクリーンショット添付をお願いします")
        self.connectState = .error

        self.showControl = true
    }

}
