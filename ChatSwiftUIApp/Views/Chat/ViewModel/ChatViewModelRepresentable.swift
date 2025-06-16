//
//  ChatViewModelRepresentable.swift
//  ChatSwiftUIApp
//
//  Created by Brandon Santeliz on 15/6/25.
//

import Foundation
import SwiftData

protocol ChatViewModelRepresentable: ObservableObject {
    var contentMessage: String { get set }
    var messages: [Message] { get }
    var showTypingIndicator: Bool { get }
    
    func sendMessage()
    func getInitialMessages(from messages: [Message])
    func updateHistory(from history: MessageHistory)
    func createNewHistory(from history: MessageHistory) -> Bool
}
