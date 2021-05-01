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
    var player   : AVPlayer
    var duration : Double

    var durationObserver: NSKeyValueObservation?

    init() {
        player   = AVPlayer(playerItem: nil)
        duration = 0
    }

    func seek(rate : Float64){
        seek(absSec: rate * duration)
    }

    func seek(deltaSec : Float64){
        seek(absSec: elapsedTime() + deltaSec)
    }

    func seek (absSec : Float64){
        let targetTime = CMTimeMakeWithSeconds( absSec, preferredTimescale: 1000 )
        player.seek( to: targetTime, toleranceBefore: .zero, toleranceAfter: .zero)
    }
    
    func elapsedTime() -> Float64 {
        let time : Float64 = CMTimeGetSeconds( player.currentTime() )
        return time.isNaN ? 0 : time
    }
    
    func remainTime() -> Float64 {
        return duration - elapsedTime()
    }

    func failed() -> Bool {
        guard let item = player.currentItem else { return false}
        return item.status == .failed
    }
    
    func play(){
        player.play()
    }
    
    func pause(){
        player.pause()
    }
    
    func loadUrl(streamUrl : URL){
        player.replaceCurrentItem(with: AVPlayerItem(url: streamUrl))

        // Update duration when the Item's duration is notified
        durationObserver = player.currentItem?.observe(
            \.duration,
            changeHandler:{ [weak self] item, change in
                guard let self = self
                else {
                    return
                }

                self.duration = item.duration.seconds
            }
        )
    }
    
    func disappear(){
        player.pause()
        durationObserver?.invalidate()
        durationObserver = nil
        
        player.replaceCurrentItem(with: nil)
    }
}
