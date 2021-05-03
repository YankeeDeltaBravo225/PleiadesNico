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

    @ObservedObject var viewModel : PlayerViewModel
    let screen: VideoScreen
    
    init(_ contentId : String){
        screen = VideoScreen()
        viewModel = PlayerViewModel(
            avScreen: screen,
            contentId: contentId
        )
    }
       
    var body: some View {
        ZStack {
            Color.black
            if( viewModel.showPlayer ){
                screenView()
                commentView()
            } else {
                progressTextsView()
            }
            if( viewModel.showControl ){
                PlayControlView( viewModel : viewModel )
            }
        }
        .alert(
            isPresented: $viewModel.showAlert,
            content: {
                Alert(title: Text("Failed to play the video"))
            }
        )
        .onAppear(){
            viewModel.onAppear()
            DispatchQueue.main.async {
                AppDelegate.lockOrientationLandscape()
            }

        }
        .onDisappear {
            viewModel.onDisappear()
            DispatchQueue.main.async {
                AppDelegate.unlockOrientation()
            }
        }
//        .navigationBarHidden( true )
        
    } // View

}


// MARK: - Extension
extension PlayerTopView {

    fileprivate func progressTextsView() -> some View {
        return ScrollView(){
            ForEach(viewModel.progressTexts, id: \.self) { progressText in
                HStack{
                    Text(progressText)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
        }
    }
    
    
    fileprivate func screenView() -> some View {
        return AvPlayerViewControllerWrap(
            player: screen.player
        )
        .modifier(
            SwipeGestureModifier(
                onLeft  : { viewModel.onSwipeLeft() },
                onRight : { viewModel.onSwipeRight() }
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
        print("Dismantle")
    }
    
}


// MARK: - Preview

struct PlayerTopView_Previews: PreviewProvider {
    static var previews: some View {
//        let url  = URL(fileURLWithPath: "/Users/tkato/Documents/XCode/VideoProto/VideoProto/sample.mp4")
        PlayerTopView("sm1192")
    }
}
