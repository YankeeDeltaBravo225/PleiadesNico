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
    let title : String
    
    @State var showControl : Bool = false
    
    var body: some View {
        VStack {
            if showControl {
                upperControlView()
                    .transition(AnyTransition.opacity.combined(with: .offset(x: 0, y: -50)))
            }
            Spacer()
            if showControl {
                playPauseButtonView()
                    .transition(.opacity)
            }
            Spacer()
            if showControl {
                lowerControlView()
                    .transition(AnyTransition.opacity.combined(with: .offset(x: 0, y: 50)))
            }
        }
        .onAppear {
            viewModel.onTimerTick()
        }
        .onReceive(viewModel.$showControl ) { newShowControl in
            withAnimation(.easeInOut(duration: 0.2)) {
                showControl = newShowControl
            }
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

        PlayControlView(viewModel: viewModel, title: "My video 1192")
    }
}


// MARK: - Extension

extension PlayControlView {

    fileprivate func closeButton() -> some View {
        return HStack{
            Button(
                action: {
                    viewModel.onClose()
                },
                label: {
                    Image(systemName:"chevron.down.circle")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                }
            )
        }
    }


    fileprivate func upperControlView() -> some View {
        return HStack{
            closeButton()
                .padding(10)
            Text(title)
                .foregroundColor(.white)
                .lineLimit(1)
            Spacer()
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
            HStack () {
                elapsedTimeView()
                Spacer()
                timeSliderView()
                Spacer()
                remainingTimeView()
            }
            Divider()
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
            .padding(4)
    }
    

    fileprivate func remainingTimeView() -> some View {
        return Text(viewModel.remainTimeText + "  ")
            .foregroundColor(.white)
            .font(.system(size: 18, design: .monospaced))
            .padding(4)
    }
    

    fileprivate func playPauseButtonView() -> some View {
        Button(action: {
            viewModel.togglePlay()
        }) {
            Image(systemName: viewModel.isPlaying ? "pause" : "play.fill" )
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .padding(10)
        }
        .shadow(color: .gray, radius: 3, x: 3, y: 3)
        .padding(10)
    }


    fileprivate func timeSliderView() -> some View {
        Slider(
            value: $viewModel.timeSliderPos,
            in: 0...1,
            onEditingChanged: onSliderChanged
        )
    }

}
