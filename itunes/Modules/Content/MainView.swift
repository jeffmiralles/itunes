//
//  MainView.swift
//  itunes
//
//  Created by Jefferson Miralles on 12/2/21.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainVM = MainViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let items = mainVM.items {
                    List(items.results, rowContent: { result in
                        NavigationLink {
                            Text("")
                        } label: {
                            HStack {
                                VStack {
                                    Text(result.trackName ?? "")
                                    Text(result.trackName ?? "")
                                }
                            }
                        }
                    })
                }
            }
            .navigationBarTitle("Movies")
            .onAppear {
                mainVM.search()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
