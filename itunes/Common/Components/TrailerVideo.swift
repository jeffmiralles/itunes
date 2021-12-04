//
//  TrailerVideo.swift
//  itunes
//
//  Created by Jefferson Miralles on 12/4/21.
//

import SwiftUI
import AVFoundation

/// Video player that plays automatically when added.
struct TrailerVideo: View {
    // MARK: - Observable Objects
    @EnvironmentObject var detailVM: DetailViewModel
    
    // MARK: - Properties
    let player: AVPlayer
    let url: URL
    let width: CGFloat
    
    // MARK: - Body
    var body: some View {
        VStack {
            VideoPlayerBridge(player: player)
                .cornerRadius(12)
                .frame(height: width / detailVM.ratio)
                .onAppear(perform: playVideo)
                .onDisappear(perform: stopVideo)
        }
    }
    
    /// Loads the video URL and play it automatically.
    private func playVideo() {
        let videoAssetSource = AVAsset.init(url: url)
        videoAssetSource.videoSizeRatio(completion: { value in
            self.detailVM.ratio = value
        })
        player.replaceCurrentItem(with: AVPlayerItem(url: url))
        player.play()
    }
    
    /// Stops the video playing and remove the `AVPlayerItem` instance.
    private func stopVideo() {
        player.replaceCurrentItem(with: nil)
    }
}

// MARK: - Previews
struct TrailerVideo_Previews: PreviewProvider {
    static let avPlayer = AVPlayer()
    static var previews: some View {
        TrailerVideo(
            player: avPlayer,
            url: URL(string: Mock.items.results[0].previewURL!)!,
            width: UIScreen.main.bounds.width
        )
            .environmentObject(DetailViewModel())
    }
}
