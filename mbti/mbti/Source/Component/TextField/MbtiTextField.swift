//
//  MbtiTextField.swift
//  mbti
//
//  Created by dgsw8th71 on 12/17/23.
//

import SwiftUI

struct MbtiTextField: View {
    
    let hint: String
    let text: Binding<String>
    let type: MbtiTextFieldType
    
    init(_ hint: String = "",
         text: Binding<String>,
         type: MbtiTextFieldType = .normal) {
        self.hint = hint
        self.text = text
        self.type = type
    }
    
    var body: some View {
        let radius = type.radius()
        TextField("",
                  text: text,
                  prompt: 
                    Text(hint)
                      .foregroundColor(.main300)
                      .applyFontStyle(.body))
            .frame(width: 256, height: 48)
            .background(Color.main100)
            .padding(.horizontal, 16)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.main300, lineWidth: 1)
            )
            .font(.body)
            .accentColor(.main300)
            .foregroundColor(.main800)
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.body)
    }
}
