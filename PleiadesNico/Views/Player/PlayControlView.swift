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
            Color.white
                .frame(height : 20)
                .ignoresSafeArea()
            upperControlView()
                .padding(10)
                .ignoresSafeArea()
            Spacer()
            Color.clear
            lowerControlView()
            .padding(10)
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
                    self.presentation.wrappedValue.dismiss()
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
            Spacer()
        }
    }


    fileprivate func upperControlView() -> some View {
        let bg = ColorPalette.controlBackground
        return HStack{
            closeButton()
                .padding(10)
            Spacer()
            Text(viewModel.currentTimeText)
                .foregroundColor(.white)
                .font(.system(size: 18, design: .monospaced))
                .padding(10)
        }
        .background(
            Color(red:bg.r , green: bg.b, blue: bg.b)
                .opacity(0.6)
        )
        .cornerRadius(10)
    }

    
    fileprivate func lowerControlView() -> some View {
        let bg = ColorPalette.controlBackground
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
            Color(red:bg.r , green: bg.b, blue: bg.b)
                .opacity(0.6)
        )
        .cornerRadius(10)
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

}
