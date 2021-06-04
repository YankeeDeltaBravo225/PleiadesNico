//
//  PlayerView.swift
//  VideoProto
//
//  Created by katot on 2021/03/20.
//

import SwiftUI

import Foundation
import Combine

// MARK: - Top View

struct PlayerTopView: View {

    @ObservedObject var viewModel : PlayerViewModel

    let screen     : VideoScreen
    let colorIndex : Int
    let title      : String
    
    @Binding var showPlayer: Bool
    
    init(_ contentId : String, colorIndex : Int, title : String, showPlayer : Binding<Bool>){
        self.screen = VideoScreen()
        self.viewModel = PlayerViewModel(
            screen: screen,
            contentId: contentId
        )
        self.colorIndex = colorIndex
        self.title      = title
        self._showPlayer = showPlayer
    }


    var body: some View {
        // Z indices are add to show remove transitions properly, see #51
        ZStack {
            backGroundView()
                .zIndex(0)
            if( viewModel.showPlayer ){
                screenView()
                    .zIndex(10)
                commentView()
                    .zIndex(11)
            } else {
                progressTextsView()
                    .zIndex(12)
            }
            PlayControlView( viewModel : viewModel, title : title )
                .zIndex(20)
            closingView()
                .zIndex(30)
        }
        .alert(
            isPresented: $viewModel.showAlert,
            content: {
                Alert(
                    title  : Text(viewModel.alertTitle),
                    message: Text(viewModel.alertMessage)
                )
            }
        )
        .onAppear(){
            if viewModel.didAppear {
                return
            }
            
            DispatchQueue.main.async {
                viewModel.onAppear()
                if viewModel.isRotateEnabled {
                    let (mask, rotation) = getPlayerOrientation()
                    AppDelegate.lockOrientation(mask: mask, rotation: rotation)
                }
            }
        }
        .onDisappear {
            DispatchQueue.main.async {
                viewModel.onDisappear()
                if viewModel.isRotateEnabled {
                    AppDelegate.unlockOrientation()
                }
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { (_) in
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { (_) in
            DispatchQueue.main.async {
                viewModel.onInactive()
            }
        }
        .onReceive(viewModel.$isClosing){ isClosing in
            if isClosing {
                showPlayer = false
            }
        }
        
    } // View

}


// MARK: - Extension
extension PlayerTopView {

    fileprivate func backGroundView() -> RadialGradient {
        let planetColor = ColorPalette.pastelColor( colorIndex )
        return RadialGradient(
            gradient: Gradient(
                colors: [planetColor, .white, .black]
            ),
            center: .bottomTrailing,
            startRadius: 60,
            endRadius: 180
        )
    }


    // time, wifi, 5G, battery will be blend in background without this layer
    fileprivate func timeBatteryBarBackground() -> some View {
        return VStack{
            ColorPalette.labelBackground
                .frame(height : 20)
                .ignoresSafeArea()
            Spacer()
        }
    }


    fileprivate func progressTextsView() -> some View {
        return VStack{
            Spacer()
            Text(viewModel.progressText)
                .foregroundColor(.white)
            Spacer()
        }
    }
    
    
    fileprivate func screenView() -> some View {
        return PlayScreenView(
            player: screen.player
        )
        .modifier(
            SwipeGestureModifier(
                onLeft    : { viewModel.onSwipeLeft() },
                onRight   : { viewModel.onSwipeRight() },
                onUp      : { viewModel.onSwipeUp() },
                onDown    : { viewModel.onSwipeDown() },
                threshold : CGFloat(viewModel.swipeThreshold)
            )
        )
        .onTapGesture {
            viewModel.onScreenTapp()
        }
        .ignoresSafeArea()
    }

    
    fileprivate func commentView() -> some View {
        return CommentView( viewModel: viewModel )
            .allowsHitTesting(false)
    }

    
    fileprivate func getPlayerOrientation() -> (UIInterfaceOrientationMask, UIDeviceOrientation) {
        let orientations : [Int: (UIInterfaceOrientationMask, UIDeviceOrientation) ] = [
            PlayerViewModel.Orientation.portrait.rawValue           : (.portrait,  .portrait),
//            PlayerViewModel.Orientation.portraitUpsideDown.rawValue : (.portrait,  .portraitUpsideDown),
            PlayerViewModel.Orientation.landscapeRight.rawValue     : (.landscape, .landscapeRight),
            PlayerViewModel.Orientation.landscapeLeft.rawValue      : (.landscape, .landscapeLeft),
        ]

        return orientations[viewModel.configOrientation] ?? (.landscape, .landscapeLeft)
    }

    fileprivate func closingView() -> some View {
        return Group{
            if viewModel.isClosing {
                Text("終了します")
                    .foregroundColor(.white)
            } else {
                EmptyView()
            }
        }
    }

}


// MARK: - Preview
struct PlayerTopView_Previews: PreviewProvider {
    @State static var showPlayer = true

    static var previews: some View {
//        let url  = URL(fileURLWithPath: "/Users/tkato/Documents/XCode/VideoProto/VideoProto/sample.mp4")
        PlayerTopView("sm1192", colorIndex: 3, title : "Preview video 1192", showPlayer: $showPlayer )
    }
}
