//
//  Button.swift
//  mbti
//
//  Created by dgsw8th71 on 12/17/23.
//

import SwiftUI

struct MbtiButton: View {
    
    let text: String
    let callback: () -> Void
    
    init(_ text: String,
         callback: @escaping () -> Void) {
        self.callback = callback
        self.text = text
    }
    
    var body: some View {
        Button {
            callback()
        } label: {
            Text(text)
                .applyFontStyle(.body)
        }
        .frame(width: 256, height: 48)
        .background(Color.main100)
        .cornerRadius(8)
        .shadow1()
    }
}


struct MbtiTransparentButton: View {
    
    let text: String
    let callback: () -> Void
    
    init(_ text: String,
         callback: @escaping () -> Void) {
        self.callback = callback
        self.text = text
    }
    
    var body: some View {
        Button {
            callback()
        } label: {
            Text(text)
                .applyFontStyle(.subtitle)
        }
    }
}
