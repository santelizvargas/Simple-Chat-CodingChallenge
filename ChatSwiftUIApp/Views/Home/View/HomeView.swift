//
//  HomeView.swift
//  ChatSwiftUIApp
//
//  Created by Brandon Santeliz on 14/6/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @State private var path: [MessageHistory] = .init()
    @Environment(\.modelContext) var context
    
    @Query(sort: \MessageHistory.timestamp, order: .reverse)
    private var messagesHistory: [MessageHistory]
    
    // MARK: - Main Component
    
    var body: some View {
        NavigationStack(path: $path) {
            Group {
                switch messagesHistory.isEmpty {
                    case true: emptyView
                    case false: listView
                }
            }
            .animation(.smooth, value: messagesHistory)
            .navigationDestination(for: MessageHistory.self) { item in
                ChatView(history: item)
            }
        }
    }
    
    // MARK: - UI Components
    
    private var emptyView: some View {
        HistoryEmptyView {
            newChatButton
                .buttonStyle(.borderedProminent)
                .padding(.top)
        }
    }
    
    private var listView: some View {
        List(messagesHistory) { history in
            NavigationLink(value: history) {
                Text(history.title)
                    .swipeActions {
                        Button("Delete", role: .destructive) {
                            context.delete(history)
                            try? context.save()
                        }
                    }
            }
        }
        .navigationTitle("History")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                newChatButton
            }
        }
    }
    
    private var newChatButton: some View {
        let newMessage = MessageHistory(
            title: .init(),
            messages: .init()
        )
        return NavigationLink(value: newMessage) {
            Text("New Chat")
        }
    }
}
