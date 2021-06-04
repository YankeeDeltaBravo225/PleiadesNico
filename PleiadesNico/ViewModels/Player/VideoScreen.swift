//
//  AVScreen.swift
//  TestBed
//
//  Created by katot on 2021/03/27.
//

import Foundation
import AVKit

// MARK: - Video Screen

class VideoScreen{

    typealias LoadHander = () -> Void
    typealias SeekHander = (Bool) -> Void

    var player          : AVPlayer
    var isSeeking       : Bool
    var duration        : Double
    var durationObserver: NSKeyValueObservation?

    
    init() {
        self.player    = AVPlayer(playerItem: nil)
        self.duration  = 0
        self.isSeeking = false
    }


    func seek(rate : Float64){
        seek(absSec: rate * duration)
    }


    func seek(deltaSec : Float64){
        seek(absSec: elapsedTime() + deltaSec)
    }


    func seek (absSec : Float64){
        if self.isSeeking {
            return
        }

        let targetSec  = min(absSec, self.duration - 0.01)
        let targetTime = CMTimeMakeWithSeconds( targetSec, preferredTimescale: 1000 )
        
        onSeekStart()
        
        player.seek(
            to                : targetTime,
            toleranceBefore   : .zero,
            toleranceAfter    : .zero,
            completionHandler : { [weak self] isFinished in
                if let self = self {
                    self.onSeekCompletion()
                }
            }
        )

    }

    
    private func onSeekStart(){
        self.isSeeking = true
    }

    
    private func onSeekCompletion(){
        self.isSeeking = false
    }
    

    func elapsedTime() -> Float64 {
        let time : Float64 = CMTimeGetSeconds( player.currentTime() )
        return time.isNaN ? 0 : time
    }
    

    func remainTime() -> Float64 {
        let remainTime = self.duration - elapsedTime()
        return remainTime < 0.0 ? 0.0 : remainTime
    }


    func failed() -> Bool {
        guard let item = self.player.currentItem else { return false}
        return item.status == .failed
    }
    

    func play(){
        self.player.play()
    }
    

    func pause(){
        self.player.pause()
    }
    

    func loadUrl(streamUrl : URL, handler : @escaping LoadHander){
        self.player.replaceCurrentItem(with: AVPlayerItem(url: streamUrl))

        // Update duration when the Item's duration is notified
        durationObserver = self.player.currentItem?.observe(
            \.duration,
            changeHandler:{ [weak self] item, change in
                guard let self = self
                else {
                    return
                }

                handler()
                self.duration = item.duration.seconds
            }
        )
    }
    

    func disappear(){
        self.player.pause()
        durationObserver?.invalidate()
        durationObserver = nil
        
        self.player.replaceCurrentItem(with: nil)
    }

}
