//
//  HistoryEmptyView.swift
//  ChatSwiftUIApp
//
//  Created by Brandon Santeliz on 14/6/25.
//

import SwiftUI

struct HistoryEmptyView<Content: View>: View {
    private let action: Content
    
    init(@ViewBuilder action: () -> Content) {
        self.action = action()
    }
    
    var body: some View {
        ContentUnavailableView {
            Label("No Messages Yet", systemImage: "paperplane.fill")
        } description: {
            Text("You don’t have any messages at the moment. Start a new conversation to get things going.")
        } actions: {
            action
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
