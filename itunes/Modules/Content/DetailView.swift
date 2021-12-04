//
//  DetailView.swift
//  itunes
//
//  Created by Jefferson Miralles on 12/3/21.
//

import SwiftUI
import AVKit
import Kingfisher

struct DetailView: View {
    // MARK: - Observable Objects
    @EnvironmentObject var detailVM: DetailViewModel
    
    // This view model can be used throughout any view that need its functionality
    @EnvironmentObject var mainVM: MainViewModel
    
    // MARK: - Properties
    let result: Result
    
    // MARK: States
    @State private var selected: Int?
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    header
                        .padding(.top, 16)
                    divider
                    if let previewURL = result.previewURL, let url = URL(string: previewURL) {
                        TrailerVideo(player: $detailVM.player, url: url, width: geometry.size.width)
                    }
                    divider
                    longDescription
                        .padding(.bottom, 8)
                    divider
                    othersList
                }
            }
            
        }
        .padding(.horizontal, 16)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Functions
    
    /// Header for the detailed view of a `Result`.
    private var header: some View {
        HStack(spacing: 16) {
            KFImage.url(URL(string: result.artworkUrl100))
                .placeholder {
                    Image.placeholder
                        .resizable()
                        .scaledToFit()
                        .frame(width: 67, height: 100)
                }
                .cornerRadius(12)
                .layoutPriority(1)
            VStack(alignment: .leading) {
                Text(result.trackName ?? "")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .lineLimit(2)
                    .foregroundColor(.primary)
                Text(result.primaryGenreName)
                    .font(.system(size: 14, design: .rounded))
                    .foregroundColor(.secondary)
                Spacer()
                HStack {
                    Button {
                        // TODO: Purchasing Item
                    } label: {
                        Text("GET")
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 4)
                            .background(
                                RoundedRectangle(cornerRadius: 99).fill(.blue)
                            )
                    }
                    Spacer()
                    Button {
                        // TODO: Share Functionality
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .frame(height: 108)
    }
    
    /// A custom divider or separator with a set of padding vertically.
    private var divider: some View {
        Divider()
            .padding(.vertical)
    }
    
    /// Long description text of fhe `Result`
    private var longDescription: some View {
        Text(result.longDescription ?? "")
            .font(.system(size: 18, design: .rounded))
            .lineSpacing(1.5)
    }
    
    /// List of items to navigate to a detailed view of `Result`
    private var othersList: some View {
        VStack(alignment: .leading) {
            Text("You Might Also Like")
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .padding(.bottom, 16)
            // TODO: Navigation To Detail View
            ForEach(mainVM.items.results[0...2], id: \.trackID, content: ResultRow.init)
        }
    }
}


// MARK: - Previews
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(result: Mock.items.results[0])
            .environmentObject(MainViewModel(repository: MockItunesRepositories()))
            .environmentObject(DetailViewModel())
    }
}
