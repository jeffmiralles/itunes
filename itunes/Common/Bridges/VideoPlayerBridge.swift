//
//  VideoPlayerBridge.swift
//  itunes
//
//  Created by Jefferson Miralles on 12/3/21.
//

import SwiftUI
import AVKit

// UIViewControllerRepresentable use to make UIKit component added to SwiftUI.
struct VideoPlayerBridge: UIViewControllerRepresentable {
    // MARK: - Properties
    var player : AVPlayer
    
    // MARK: - Init
    func makeUIViewController(context: Context) ->  AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = true
        controller.exitsFullScreenWhenPlaybackEnds = true
        controller.allowsPictureInPicturePlayback = true
        return controller
    }
    
    // MARK: - Updates
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        print("AAAA")
    }
}
