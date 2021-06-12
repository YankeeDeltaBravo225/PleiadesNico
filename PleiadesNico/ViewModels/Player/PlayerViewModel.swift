//
//  AVControlViewModel.swift
//  TestBed
//
//  Created by katot on 2021/03/27.
//

import Foundation
import Combine
import UIKit

// MARK: - View Model

final class PlayerViewModel: ObservableObject {

    typealias Orientation = ConfigStorage.PlayerOrientation
    
    @Published var isPlaying         : Bool   = false
    @Published var isClosing         : Bool   = false
    @Published var showControl       : Bool   = false
    @Published var showSeekBar       : Bool   = false
    @Published var showPlayer        : Bool   = false
    @Published var showAlert         : Bool   = false
    @Published var didAppear         : Bool   = false

    @Published var alertTitle        : String = ""
    @Published var alertMessage      : String = ""
    @Published var elapsedTimeText   : String = "--:--"
    @Published var remainTimeText    : String = "--:--"
    @Published var currentTimeText   : String = ""
    @Published var progressText      : String = ""
    @Published var timeSliderPos     : Double = 0.0
    @Published var elapsedTime       : Double = 0.0
    @Published var commentFontSize   : Int    = ConfigStorage.shared.commentFontSize
    @Published var commentStrokeSize : Int    = ConfigStorage.shared.commentStrokeSize
    @Published var commentMaxDispNum : Int    = ConfigStorage.shared.commentMaxDispNum
    @Published var swipeThreshold    : Int    = ConfigStorage.shared.swipeThreshold
    @Published var configOrientation : Int    = ConfigStorage.shared.playerOrientation
    @Published var isRotateEnabled   : Bool   = ConfigStorage.shared.playerOrientation != PlayerViewModel.Orientation.none.rawValue
    
    
    private    let contentId       : String
    private    let screen          : VideoScreen
    private    let connect         : StreamConnection

    private    var errorCount      : Int
    private    var prevElapsedTime : Int
    private    var isTimeSliding   : Bool
    private    var isReady         : Bool
    private    var controlFadeTime : Double
    private    var doesControlFade : Bool
    private    var seekBarFadeTime : Double
    private    var doesSeekBarFade : Bool
    
    private    var timer           : Cancellable?


    init(screen : VideoScreen, contentId : String) {
        self.contentId       = contentId
        self.screen          = screen
        self.connect         = StreamConnection(contentId: contentId)
        
        self.elapsedTime     = 0.0
        self.errorCount      = 0
        self.prevElapsedTime = -1
        self.isTimeSliding   = false
        self.isReady         = false
        self.controlFadeTime = -1.0
        self.doesControlFade = false
        self.seekBarFadeTime = -1.0
        self.doesSeekBarFade = false
    }


    func onAppear(){
        if self.didAppear {
            return
        }

        self.didAppear = true
        
        self.connect.onSuccess = { url in
            self.onConnectSuccess(streamUrl: url)
        }

        self.connect.onError = { reason, detail
            in self.onError(reason: reason, detail: detail)
        }

        self.timer = Timer.publish(every: 0.1, on: .main, in: .default)
            .autoconnect()
            .sink(receiveValue: { date in
                    self.onTimerTick()
                    self.connect.advance()
                    self.progressText = self.connect.progress
                }
            )
    }


    func onActive(){
    }
    
    
    func onInactive(){
        screen.pause()
        onPause()
    }


    func onConnectSuccess(streamUrl : URL) {
        screen.loadUrl(
            streamUrl: streamUrl,
            handler: {
                self.onVideoLoaded()
            }
        )

        self.showPlayer   = true
        self.showControl  = true
        self.showSeekBar  = true
    }

    
    func onVideoLoaded() {
        if self.isReady {
            // Called for seek completion
            return
        }
        
        self.isReady = true

        self.screen.play()
        self.onPlay()
    }
    

    func onError(reason : String, detail : String) {
        self.showControl  = true
        self.showSeekBar  = true
        self.alertTitle   = reason
        self.alertMessage = [
            "エラー報告の際はこちらのスクリーンショット添付をお願いします。",
            "",
            self.contentId,
            "ログイン:\(ConfigStorage.shared.loginStatus ? "Yes": "No")",
            "プレミアム:\((connect.isPremium ?? false) ? "Yes": "No")",
            "アプリのバージョン:\(CommonData.appVersion)",
            "機種名:\(UIDevice().model)",
            "OS:\(UIDevice.current.systemName + UIDevice.current.systemVersion)",
            detail
        ].reduce(""){$0 + "\n" + $1}
        
        if self.errorCount == 0 {
            self.showAlert = true
            self.timer?.cancel()
        }
        errorCount += 1
    }
    

    func onDisappear(){
        self.timer?.cancel()
    }


    func onClose(){
        self.timer?.cancel()
        self.screen.pause()
        self.screen.disappear()

        self.isClosing = true
    }
    
    
    func onPlay(){
        if !self.isReady {
            return
        }
        
        self.isPlaying   = true
        self.restartControlFade()
        self.restartSeekBarFade()
    }


    func onPause(){
        if !self.isPlaying {
            return
        }
        
        self.isPlaying   = false
        self.showControl = true
        self.showSeekBar = true
    }
 
    
    func togglePlay(){
        if self.isPlaying {
            screen.pause()
            onPause()
        } else {
            screen.play()
            onPlay()
        }
    }

    
    func seekDelta(_ deltaSec : Double, isGesure : Bool) {
        screen.seek(deltaSec : deltaSec)

        self.showSeekBar = true
        restartSeekBarFade()

        if !isGesure {
            self.showControl = true
        }
        restartControlFade()
    }
    

    func onScreenTapp(){
        self.showControl.toggle()
        self.showSeekBar = self.showControl
        self.doesControlFade = false
        self.doesSeekBarFade = false
    }


    func onSwipeLeft(){
        handleGesture( gestureType : ConfigStorage.GestureType.swipeLeft )
    }


    func onSwipeRight(){
        handleGesture( gestureType : ConfigStorage.GestureType.swipeRight )
    }


    func onSwipeUp(){
        handleGesture( gestureType : ConfigStorage.GestureType.swipeUp )
    }


    func onSwipeDown(){
        handleGesture( gestureType : ConfigStorage.GestureType.swipeDown )
    }
    
    
    private func handleGesture( gestureType : ConfigStorage.GestureType ) {
        let operation = ConfigStorage.shared.getGestureOperation(gestureType: gestureType.rawValue)
        
        switch(operation){
        case ConfigStorage.GestureOperation.plus10Sec.rawValue:
            seekDelta(10.0, isGesure: true)
        case ConfigStorage.GestureOperation.minus10Sec.rawValue:
            seekDelta(-10.0, isGesure: true)
        case ConfigStorage.GestureOperation.close.rawValue:
            self.onClose()
            self.showControl = true
            self.showSeekBar = true
        case ConfigStorage.GestureOperation.none.rawValue:
            break
        default:
            break
        }
    }


    func onTimerTick(){
        if self.screen.failed() {
            onError(reason: "動画の再生に失敗しました。", detail: "")
        }
        
        if self.isPlaying && !self.screen.isSeeking {
            countDownControlFade()
            countDownSeekBarFade()
        }

        if !self.isTimeSliding {
            updateTime()
        }
    }


    func onTimeSliderChange(start : Bool){
        self.screen.seek(rate : timeSliderPos)
        self.isTimeSliding = start
    }

    
    // todo: Refactoring
    func countDownControlFade(){
        if !self.doesControlFade || !self.showControl {
            return
        }
        
        self.controlFadeTime -= 0.1

        if self.controlFadeTime < 0.0 {
            self.showControl     = false
            self.doesControlFade = false
        }
    }


    // todo: Refactoring
    func restartControlFade(){
        self.controlFadeTime = Double(ConfigStorage.shared.controlFadeTime)
        self.doesControlFade = true
    }

    
    // todo: Refactoring
    func countDownSeekBarFade(){
        if !self.doesSeekBarFade || !self.showSeekBar {
            return
        }
        
        self.seekBarFadeTime -= 0.1

        if self.seekBarFadeTime < 0.0 {
            self.showSeekBar     = false
            self.doesSeekBarFade = false
        }
    }


    // todo: Refactoring
    func restartSeekBarFade(){
        self.seekBarFadeTime = Double(ConfigStorage.shared.controlFadeTime)
        self.doesSeekBarFade = true
    }


    func updateTime(){
        let duration = self.screen.duration
        if duration == 0.0 {
            return
        }

        let elapsedTime   = self.screen.elapsedTime()
        let remainingTime = self.screen.remainTime()
        let intElapsedTime = Int(elapsedTime)

        if intElapsedTime != self.prevElapsedTime {
            self.elapsedTimeText = TextFormat.shared.time( elapsedTime,   duration )
            self.remainTimeText  = TextFormat.shared.time( remainingTime, duration )

            self.prevElapsedTime = intElapsedTime
        }
        
        if duration != 0 {
            self.timeSliderPos = elapsedTime / duration
        }
        
        if isFinished() {
            onPause()
        }

        self.elapsedTime     = elapsedTime
        self.currentTimeText = TextFormat.shared.currentTime()
    }


    func isFinished() -> Bool {
        return abs( self.screen.remainTime() ) < 0.1
    }
    
    
    
    func comments() -> [StreamConnection.Comment] {
        return self.connect.comments
    }

}
