//
//  SwipeGesture.swift
//  TestBed
//
//  Created by katot on 2021/03/27.
//

import SwiftUI

// MARK: - SwipeGesture Modifier

struct SwipeGestureModifier: ViewModifier {

    typealias OnSwipe = () -> Void
    
    let onLeft  : OnSwipe?
    let onRight : OnSwipe?
    let onUp    : OnSwipe?
    let onDown  : OnSwipe?
    
    @State var isKnownDrag : Bool = false
    
    func body( content: Content ) -> some View {
        content
            .gesture(
                swipeGesture()
            )
    }

    func swipeGesture() -> some Gesture {
        let gesture = DragGesture()
            .onChanged(
                { value in
                    if self.isKnownDrag {
                        return
                    }

                    let deltaX = value.translation.width
                    let deltaY = value.translation.height
                    
                    if abs(deltaX) >= 50 {
                        if deltaX > 0 {
                            onRight?()
                        } else {
                            onLeft?()
                        }
                        self.isKnownDrag = true
                    } else if abs(deltaY) >= 50 {
                        if deltaX > 0 {
                            onUp?()
                        } else {
                            onDown?()
                        }
                        self.isKnownDrag = true
                    }
                }
            )
            .onEnded(
                {value in
                    self.isKnownDrag = false
                }
            )
        
        return gesture
    }

}
