//
//  MessageInputView.swift
//  ChatSwiftUIApp
//
//  Created by Brandon Santeliz on 15/06/25.
//

import SwiftUI

struct MessageInputView: View {
    @Binding private var inputText: String
    private let onSend: () -> Void
    
    init(inputText: Binding<String>, onSend: @escaping () -> Void) {
        _inputText = inputText
        self.onSend = onSend
    }

    var body: some View {
        HStack {
            TextField("Type a message", text: $inputText, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .frame(minHeight: 40)
            
            Button(action: onSend) {
                Image(systemName: "paperplane.fill")
            }
            .disabled(inputText.isEmpty)
            .foregroundStyle(inputText.isEmpty ? .gray : .blue)
        }
        .padding()
    }
}
