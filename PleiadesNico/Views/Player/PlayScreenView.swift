//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI
import AVKit

struct PlayScreenView : UIViewControllerRepresentable {

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

struct ScreenView_Previews: PreviewProvider {
    static var previews: some View {
        PlayScreenView(player: AVPlayer(playerItem: nil))
    }
}
