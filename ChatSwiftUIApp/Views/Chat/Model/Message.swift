//
//  Message.swift
//  ChatSwiftUIApp
//
//  Created by Brandon Santeliz on 15/06/25.
//

import Foundation
import SwiftData

@Model
final class Message: Identifiable, Equatable {
    @Attribute(.unique) var id: UUID = UUID()
    var content: String
    var messageType: MessageType
    var timestamp: Date = Date()
    
    init(content: String, messageType: MessageType = .user) {
        self.content = content
        self.messageType = messageType
    }
}
