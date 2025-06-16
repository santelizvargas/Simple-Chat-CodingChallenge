//
//  ChatSwiftUIAppApp.swift
//  ChatSwiftUIApp
//
//  Created by Brandon Santeliz on 15/06/25.
//

import SwiftUI

@main
struct ChatSwiftUIAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .modelContainer(for: MessageHistory.self)
        }
    }
}
