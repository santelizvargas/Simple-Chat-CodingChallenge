//
//  MessageBubbleView.swift
//  ChatSwiftUIApp
//
//  Created by Brandon Santeliz on 15/06/25.
//

import SwiftUI

struct MessageBubbleView: View {
    @State private var content: String = ""
    private let message: Message
    
    init(message: Message) {
        self.message = message
    }
    
    var body: some View {
        Text(content)
            .padding()
            .foregroundStyle(message.messageType.foregroundStyle)
            .background(message.messageType.backgroundColor)
            .clipShape(
                .rect(
                    topLeadingRadius: 15, // TODO: - Add Constants
                    bottomLeadingRadius: message.messageType.radius.leading,
                    bottomTrailingRadius: message.messageType.radius.trailing,
                    topTrailingRadius: 15
                )
            )
            .frame(maxWidth: .infinity, alignment: message.messageType.alignment)
            .padding(.leading, message.messageType.padding.leading)
            .padding(.trailing, message.messageType.padding.trailing)
            .onAppear {
                withAnimation {
                    content = message.content
                }
            }
    }
}
