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
    func makeUIViewController(context: Context) ->  UIViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = true
        controller.exitsFullScreenWhenPlaybackEnds = true
        controller.allowsPictureInPicturePlayback = true
        return controller
    }
    
    // MARK: - Updates
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        uiViewController.view.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 200, height: 200))
    }
}
