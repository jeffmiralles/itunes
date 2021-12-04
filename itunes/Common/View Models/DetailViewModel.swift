//
//  DetailViewModel.swift
//  itunes
//
//  Created by Jefferson Miralles on 12/3/21.
//

import Foundation
import UIKit
import AVFoundation

/// Detail View Model
final class DetailViewModel: ObservableObject {
    // MARK: - Property Wrappers
    @Published var player = AVPlayer()
    @Published var ratio: CGFloat = 2.3
    
    // MARK: - Functions
    
    /// Stops the video playing and remove the `AVPlayerItem` instance.
    func stopVideo() {
        player.replaceCurrentItem(with: nil)
    }
}
