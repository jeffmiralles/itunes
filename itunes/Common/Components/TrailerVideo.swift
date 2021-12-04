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
    let url: URL
    let width: CGFloat
    
    // MARK: Bindings
    @Binding var player: AVPlayer
    
    init(player: Binding<AVPlayer>, url: URL, width: CGFloat) {
        self.url = url
        self.width = width
        _player = player
        playVideo()
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            VideoPlayerBridge(player: detailVM.player)
                .cornerRadius(12)
                .frame(height: width / detailVM.ratio)
                .onAppear(perform: resizeVideo)
        }
    }
    
    // MARK: - Functions
    
    /// Resizes the frame of the video player.
    private func resizeVideo() {
        let videoAssetSource = AVAsset.init(url: url)
        videoAssetSource.videoSizeRatio(completion: { value in
            self.detailVM.ratio = value
        })
    }
    
    /// Loads the video URL and play it automatically.
    private func playVideo() {
        player.replaceCurrentItem(with: AVPlayerItem(url: url))
        player.play()
    }
}

// MARK: - Previews
struct TrailerVideo_Previews: PreviewProvider {
    static let avPlayer = AVPlayer()
    static var previews: some View {
        TrailerVideo(
            player: .constant(AVPlayer()),
            url: URL(string: Mock.items.results[0].previewURL!)!,
            width: UIScreen.main.bounds.width
        )
            .environmentObject(DetailViewModel())
    }
}
