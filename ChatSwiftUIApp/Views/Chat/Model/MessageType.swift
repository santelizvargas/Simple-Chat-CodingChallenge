//
//  MessageType.swift
//  ChatSwiftUIApp
//
//  Created by Brandon Santeliz on 15/6/25.
//

import SwiftUI

enum MessageType: String, Codable {
    case user, bot
    
    var foregroundStyle: Color {
        switch self {
            case .user: .white
            case .bot: .black
        }
    }
    
    var backgroundColor: Color {
        switch self {
            case .user: .blue
            case .bot: .gray.opacity(0.2)
        }
    }
    
    var alignment: Alignment {
        switch self {
            case .user: .trailing
            case .bot: .leading
        }
    }
    
    var padding: (leading: CGFloat, trailing: CGFloat) {
        let maximunPadding: CGFloat = 40
        let minimumPadding: CGFloat = 20
        
        return switch self {
            case .user: (leading: maximunPadding, trailing: minimumPadding)
            case .bot: (leading: minimumPadding, trailing: maximunPadding)
        }
    }
    
    var radius: (leading: CGFloat, trailing: CGFloat) {
        let maximunRadius: CGFloat = 15
        let minimumRadius: CGFloat = .zero
        
        return switch self {
            case .user: (leading: maximunRadius, trailing: minimumRadius)
            case .bot: (leading: minimumRadius, trailing: maximunRadius)
        }
    }
}
