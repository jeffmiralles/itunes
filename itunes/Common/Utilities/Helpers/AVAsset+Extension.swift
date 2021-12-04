//
//  AVAsset+Extension.swift
//  itunes
//
//  Created by Jefferson Miralles on 12/3/21.
//

import Foundation
import AVKit

extension AVAsset{
    func videoSizeRatio(completion: @escaping (CGFloat) -> Void) {
        DispatchQueue.global(qos: .utility).async {
            print("This is run on a background queue")
            let tracks = self.tracks(withMediaType: AVMediaType.video)
            if tracks.count > 0 {
                let videoTrack = tracks[0]
                let size = videoTrack.naturalSize
                let txf = videoTrack.preferredTransform
                let realVidSize = size.applying(txf)
                DispatchQueue.main.async {
                    completion(realVidSize.width / realVidSize.height)
                }
                return
            }
            DispatchQueue.main.async {
                completion(0.0)
            }
        }
    }

}
