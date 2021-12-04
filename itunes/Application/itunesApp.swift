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
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(MainViewModel())
                .environmentObject(DetailViewModel())
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                    savedDate = Date()
                }
        }
    }
}
