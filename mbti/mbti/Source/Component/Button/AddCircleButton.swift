//
//  AddCircle.swift
//  mbti
//
//  Created by dgsw8th71 on 12/17/23.
//

import SwiftUI

struct AddCircleButton: View {
    
    let callback: () -> Void
    
    init(callback: @escaping () -> Void) {
        self.callback = callback
    }
    
    var body: some View {
        Button {
            callback()
        } label: {
            Image("Add")
                .resizable()
                .frame(width: 24, height: 24)
        }
        .frame(width: 67, height: 67)
        .background(Color.white)
        .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.gray100, lineWidth: 2)
            )
        .cornerRadius(50)
    }
}
