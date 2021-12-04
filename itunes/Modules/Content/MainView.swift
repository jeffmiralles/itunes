//
//  MainView.swift
//  itunes
//
//  Created by Jefferson Miralles on 12/2/21.
//

import SwiftUI

struct MainView: View {
    // MARK: - User Default Storage
    @AppStorage("trackID") var trackID: Int = 0
    @AppStorage("savedDate") var savedDate: Date = Date()
    
    // MARK: Observable Objects
    @EnvironmentObject var mainVM: MainViewModel
    @EnvironmentObject var detailVM: DetailViewModel
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            resultsList
        }
    }
    
    /// List of `Result` shown after calling `searchTerm` method
    private var resultsList: some View {
        let binding = Binding<Int?>(
            get: {
                self.trackID
            },
            set: {
                self.trackID = $0 ?? 0
                if self.trackID == 0 {
                    self.detailVM.stopVideo()
                }
            }
        )
        return ScrollViewReader { proxy in
            List {
                Section {
                    ForEach(mainVM.items.results, id: \.trackID) { result in
                        NavigationLink(tag: result.trackID, selection: binding) {
                            DetailView(result: result)
                        } label: {
                            ResultRow(result)
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                    }
                    .onAppear {
                        print("trackID: \(trackID)")
                        proxy.scrollTo(trackID)
                    }
                } header: {
                    HStack {
                        Text("Last Visit: \(savedDate.getFormattedDate(format: "MMMM d, YYYY h:mm a"))")
                    }
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.insetGrouped)
        }
        .navigationBarTitle("Movies")
    }
}

// MARK: - Previews
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(MainViewModel(repository: MockItunesRepositories()))
    }
}
