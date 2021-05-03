//
//  PlayControlView.swift
//  TestBed
//
//  Created by katot on 2021/03/27.
//

import Foundation
import SwiftUI

// MARK: - Play Control View

struct PlayControlView: View {
    @ObservedObject var viewModel: PlayerViewModel
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            ZStack{
                Color.black
                    .frame(maxHeight: 60)
                    .opacity(0.5)
                    .allowsHitTesting(true)
                closeButton()
            }
            Spacer()
            Color.clear
            VStack{
                Divider()
                HStack (alignment: .bottom) {
                    elapsedTimeView()
                    Spacer()
                    playPauseButtonView()
                    Spacer()
                    remainingTimeView()
                }
                timeSliderView()
            }
            .background(
                backgroundImageView()
            )
        }
        .onAppear {
            viewModel.onTimerTick()
        }

    }

    private func onSliderChanged(isStart: Bool) {
        viewModel.onTimeSliderChange(start: isStart)
    }

}


// MARK: - Preview

// MARK: -  Preview
struct PlayControlView_Previews: PreviewProvider {
    static var previews: some View {
        let screen    = VideoScreen()
        let viewModel = PlayerViewModel(
            avScreen  : screen,
            contentId : "sm1192"
        )

        PlayControlView(viewModel: viewModel)
    }
}


// MARK: - Extension

extension PlayControlView {

    fileprivate func closeButton() -> some View {
        return HStack{
            Button(
                action: {
                    self.presentation.wrappedValue.dismiss()
                    viewModel.onClose()
                },
                label: {
                    Image(systemName:"chevron.down.circle")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                }
            )
            Spacer()
        }
    }


    fileprivate func elapsedTimeView() -> some View {
        return Text("  " + viewModel.elapsedTimeText)
            .foregroundColor(.white)
            .font(.system(size: 18, design: .monospaced))
    }
    

    fileprivate func remainingTimeView() -> some View {
        return Text(viewModel.remainTimeText + "  ")
            .foregroundColor(.white)
            .font(.system(size: 18, design: .monospaced))
    }


    fileprivate func backgroundImageView() -> some View {
        return Color.black
            .opacity(0.5)
    }
    

    fileprivate func playPauseButtonView() -> some View {
        Button(action: {
            viewModel.togglePlay()
        }) {
            Image(systemName: viewModel.isPlaying ? "pause" : "play.fill" )
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: 30, height: 30)
        }
    }


    fileprivate func timeSliderView() -> some View {
        Slider(
            value: $viewModel.timeSliderPos,
            in: 0...1,
            onEditingChanged: onSliderChanged
        )
    }

}
