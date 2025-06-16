//
//  MessageHistory.swift
//  ChatSwiftUIApp
//
//  Created by Brandon Santeliz on 14/6/25.
//

import Foundation
import SwiftData

@Model
final class MessageHistory: Hashable {
    @Attribute(.unique) var id: UUID = UUID()
    var title: String
    var timestamp: Date = Date()
    var messages: [Message] = []
    
    init(title: String, messages: [Message]) {
        self.title = title
        self.messages = messages
    }
}
