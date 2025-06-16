//
//  TypingIndicatorView.swift
//  ChatSwiftUIApp
//
//  Created by Brandon Santeliz on 15/06/25.
//

import SwiftUI

// TODO: - Add Constants

struct TypingIndicatorView: View {
    @State private var animating: Bool = true
    
    var body: some View {
        HStack(spacing: 5) {
            Circle()
                .opacity(animating ? 0.7 : 0.1)
            
            Circle()
                .opacity(animating ? 0.5 : 0.1)
            
            Circle()
                .opacity(animating ? 0.3 : 0.1)
        }
        .frame(height: 8)
        .foregroundStyle(.gray)
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 20)
        .onAppear {
            withAnimation(.smooth.repeatForever()) {
                animating.toggle()
            }
        }
    }
}
