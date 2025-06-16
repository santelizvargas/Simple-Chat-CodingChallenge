//
//  ChatView.swift
//  ChatSwiftUIApp
//
//  Created by Brandon Santeliz on 15/06/25.
//

import SwiftUI
import SwiftData

private struct Constants {
    static let indicatorId: String = "LoadingIndicator"
    static let messageSpacing: CGFloat = 10
}

// MARK: - ChatView

struct ChatView<ViewModel: ChatViewModelRepresentable>: View {
    @Environment(\.modelContext) var context
    @ObservedObject private var viewModel: ViewModel
    @Bindable private var history: MessageHistory
    
    init(
        viewModel: ViewModel = ChatViewModel(),
        history: MessageHistory
    ) {
        self.viewModel = viewModel
        self.history = history
    }
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: Constants.messageSpacing) {
                        ForEach(viewModel.messages) { message in
                            MessageBubbleView(message: message)
                        }
                        
                        if viewModel.showTypingIndicator {
                            TypingIndicatorView()
                                .id(Constants.indicatorId)
                        }
                    }
                }
                .onChange(of: viewModel.messages) { _, _ in
                    scrollToBottom(proxy: proxy)
                }
            }
            
            MessageInputView(
                inputText: $viewModel.contentMessage,
                onSend: viewModel.sendMessage
            )
        }
        .navigationTitle("Chat")
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear(perform: updateHistory)
        .onAppear {
            viewModel.getInitialMessages(from: history.messages)
        }
    }
    
    // MARK: - Functions
    
    private func scrollToBottom(proxy: ScrollViewProxy) {
        withAnimation(.smooth) {
            if viewModel.showTypingIndicator {
                proxy.scrollTo(Constants.indicatorId, anchor: .bottom)
            } else if let newMessageId = viewModel.messages.last?.id {
                proxy.scrollTo(newMessageId, anchor: .bottom)
            }
        }
    }
    
    private func updateHistory() {
        switch history.title.isEmpty {
            case true:
                guard viewModel.createNewHistory(from: history) else { return }
                context.insert(history)
                try? context.save()
            case false:
                viewModel.updateHistory(from: history)
        }
    }
}
