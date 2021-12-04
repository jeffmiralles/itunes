//
//  itunesApp.swift
//  itunes
//
//  Created by Jefferson Miralles on 12/2/21.
//

import SwiftUI

@main
struct itunesApp: App {
    // MARK: - User Default Storage
    @AppStorage("savedDate") var savedDate: Date = Date()
    
    // MARK: - View Models
    @StateObject var mainMV: MainViewModel = .init()
    @StateObject var detailMV: DetailViewModel = .init()
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(mainMV)
                .environmentObject(detailMV)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                    savedDate = Date()
                }
        }
    }
}
