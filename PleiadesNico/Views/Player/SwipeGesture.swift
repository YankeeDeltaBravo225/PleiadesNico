//
//  SwipeGesture.swift
//  TestBed
//
//  Created by katot on 2021/03/27.
//

import SwiftUI

// MARK: - SwipeGesture Modifier

struct SwipeGestureModifier: ViewModifier {

    let onLeft  : () -> Void
    let onRight : () -> Void

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
                    let deltaX = value.translation.width

                    if abs(deltaX) < 50 {
                        return
                    }

                    if self.isKnownDrag {
                        return
                    }
                    
                    if deltaX > 0 {
                        onRight()
                    } else {
                        onLeft()
                    }
                    self.isKnownDrag = true
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
