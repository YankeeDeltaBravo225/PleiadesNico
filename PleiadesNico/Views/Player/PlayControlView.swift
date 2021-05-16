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
            upperControlView()
            Spacer()
            closingView()
            Spacer()
            lowerControlView()
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
            screen  : screen,
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
                    viewModel.onClose()
                    self.presentation.wrappedValue.dismiss()
                },
                label: {
                    Image(systemName:"chevron.down.circle")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                }
            )
            Spacer()
        }
    }


    fileprivate func upperControlView() -> some View {
        return HStack{
            closeButton()
                .padding(10)
            Spacer()
            Image(systemName:"clock")
                .foregroundColor(.white)
            Text(viewModel.currentTimeText)
                .foregroundColor(.white)
                .font(.system(size: 18, design: .monospaced))
                .padding(10)
        }
        .background(
            ColorPalette.controlBackground
                .opacity(0.6)
        )
        .cornerRadius(10)
        .padding(10)
    }

    
    fileprivate func lowerControlView() -> some View {
        return VStack{
            Divider()
            timeSliderView()
            HStack (alignment: .bottom) {
                elapsedTimeView()
                Spacer()
                playPauseButtonView()
                Spacer()
                remainingTimeView()
            }
        }
        .background(
            ColorPalette.controlBackground
                .opacity(0.6)
        )
        .cornerRadius(10)
        .padding(10)
    }


    fileprivate func elapsedTimeView() -> some View {
        return Text("  " + viewModel.elapsedTimeText)
            .foregroundColor(.white)
            .font(.system(size: 18, design: .monospaced))
            .padding(10)
    }
    

    fileprivate func remainingTimeView() -> some View {
        return Text(viewModel.remainTimeText + "  ")
            .foregroundColor(.white)
            .font(.system(size: 18, design: .monospaced))
            .padding(10)
    }
    

    fileprivate func playPauseButtonView() -> some View {
        Button(action: {
            viewModel.togglePlay()
        }) {
            Image(systemName: viewModel.isPlaying ? "pause" : "play.fill" )
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .padding(10)
        }
    }


    fileprivate func timeSliderView() -> some View {
        Slider(
            value: $viewModel.timeSliderPos,
            in: 0...1,
            onEditingChanged: onSliderChanged
        )
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
