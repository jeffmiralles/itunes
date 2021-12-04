//
//  ResultRow.swift
//  itunes
//
//  Created by Jefferson Miralles on 12/3/21.
//

import SwiftUI
import Kingfisher
import MapKit

/// A list row representation of `Result` data.
struct ResultRow: View {
    // MARK: - Properties
    let result: Result
    
    // MARK: Init
    
    /// Creates a row element.
    ///
    /// - Parameters:
    ///   - result: `Result` for which to populate the element.
    init(_ result: Result) {
        self.result = result
    }
    
    // MARK: - Body
    var body: some View {
        HStack {
            ZStack(alignment: .bottomLeading) {
                KFImage.url(URL(string: result.artworkUrl100))
                    .placeholder {
                        Image.placeholder
                            .resizable()
                            .scaledToFit()
                            .frame(width: 67.0, height: 100.0)
                    }
                if let price = result.trackPrice {
                    Text("$\(price, specifier: "%.2f")")
                        .font(.system(size: 12, weight: .semibold ,design: .rounded))
                        .foregroundColor(.white)
                        .padding(.horizontal, 4)
                        .background(
                            RoundedRectangle(cornerRadius: 0).fill(Color.red)
                        )
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                Text(result.trackName ?? "")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                Text(result.primaryGenreName)
                    .font(.system(size: 12, design: .rounded))
                    .foregroundColor(.secondary)
            }
        }
    }
}

// MARK: - Previews
struct ResultRow_Previews: PreviewProvider {
    static var previews: some View {
        ResultRow(Mock.items.results[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
