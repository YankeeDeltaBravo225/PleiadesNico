//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI

final class PullDetectorViewModel: ObservableObject {

    private var baseY      : CGFloat
    private var hasBaseY   : Bool
    private var isPrevPull : Bool
    
    private let threshold : CGFloat
    private let onStart   : CommonData.PlainClosure
    private let onFinish  : CommonData.PlainClosure


    init( threshold : CGFloat, onStart : @escaping CommonData.PlainClosure, onFinish : @escaping CommonData.PlainClosure ){
        self.baseY       = 0
        self.hasBaseY    = false
        self.isPrevPull  = false

        self.threshold = threshold
        self.onStart   = onStart
        self.onFinish  = onFinish
    }


    func update(_ currentY : CGFloat){

        if !self.hasBaseY {
            self.baseY    = currentY
            self.hasBaseY = true

            return
        }

        let deltaY = currentY - self.baseY
        let isCurrentPull = deltaY > self.threshold
        
        if isCurrentPull && !self.isPrevPull {
            self.onStart()
        } else if !isCurrentPull && self.isPrevPull {
            self.onFinish()
        }
        
        self.isPrevPull = isCurrentPull
    }
    
}
