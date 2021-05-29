//
//  PlayerView.swift
//  VideoProto
//
//  Created by katot on 2021/03/20.
//

import SwiftUI

import Foundation
import Combine
import AVKit

// MARK: - Top View

struct PlayerTopView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var viewModel : PlayerViewModel
    let screen     : VideoScreen
    let colorIndex : Int
    
    init(_ contentId : String, colorIndex : Int){
        self.screen = VideoScreen()
        self.viewModel = PlayerViewModel(
            screen: screen,
            contentId: contentId
        )
        self.colorIndex = colorIndex
    }


    var body: some View {
        ZStack {
            backGroundView()
            if( viewModel.showPlayer ){
                screenView()
                commentView()
            } else {
                progressTextsView()
            }
            if( viewModel.showControl ){
//                timeBatteryBarBackground()
                PlayControlView( viewModel : viewModel )
            }
            closingView()
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
        return AvPlayerViewControllerWrap(
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
                    .onAppear(){
                        self.presentation.wrappedValue.dismiss()
                    }
            } else {
                EmptyView()
            }
        }
    }

}


// MARK: - ViewController
struct AvPlayerViewControllerWrap : UIViewControllerRepresentable {

    var player : AVPlayer

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.showsPlaybackControls = false
        controller.player  = player

        return controller
    }
    
    func updateUIViewController(_ controller: AVPlayerViewController, context: Context) {
    }
    
    func dismantleUIViewController(_ uiViewController: Self.UIViewControllerType, coordinator: Self.Coordinator){
    }
    
}


// MARK: - Preview

struct PlayerTopView_Previews: PreviewProvider {
    static var previews: some View {
//        let url  = URL(fileURLWithPath: "/Users/tkato/Documents/XCode/VideoProto/VideoProto/sample.mp4")
        PlayerTopView("sm1192", colorIndex: 3)
    }
}
