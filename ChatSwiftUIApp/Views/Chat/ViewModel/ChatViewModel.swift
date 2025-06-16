//
//  ChatViewModel.swift
//  ChatSwiftUIApp
//
//  Created by Brandon Santeliz on 15/06/25.
//

import Foundation

final class ChatViewModel {
    @Published var contentMessage: String = ""
    @Published private(set) var messages: [Message] = []
    @Published private(set) var showTypingIndicator: Bool = false
    
    // MARK: - Private functions

    private func simulateReply() {
        showTypingIndicator = true
        
        Task { @MainActor in
            try? await Task.sleep(for: .seconds(5)) // No constants needed
            
            let replyMessage = Message(content: "This is an automated reply.", messageType: .bot)
            messages.append(replyMessage)
            
            showTypingIndicator = false
        }
    }
    
    private func sortMessages(from messages: [Message]) -> [Message] {
        messages.sorted { $0.timestamp < $1.timestamp }
    }
}

// MARK: - ChatViewModel Representable

extension ChatViewModel: ChatViewModelRepresentable {
    func sendMessage() {
        let newMessage = Message(content: contentMessage)
        contentMessage = ""
        messages.append(newMessage)
        
        simulateReply()
    }
    
    func getInitialMessages(from messages: [Message]) {
        self.messages = sortMessages(from: messages)
    }
    
    func createNewHistory(from history: MessageHistory) -> Bool {
        guard let title = messages.first?.content else { return false }
        history.title = title
        updateHistory(from: history)
        return true
    }
    
    func updateHistory(from history: MessageHistory) {
        guard messages != sortMessages(from: history.messages) else { return }
        history.timestamp = .now
        history.messages = messages
    }
}
