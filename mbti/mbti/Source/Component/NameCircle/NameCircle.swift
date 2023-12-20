//
//  NameCircle.swift
//  mbti
//
//  Created by dgsw8th71 on 12/17/23.
//

import SwiftUI

struct NameCircle: View {
    
    let text: String
    let type: NameCircleType
    
    init(_ text: String, type: NameCircleType) {
        self.text = text
        self.type = type
    }
    
    var body: some View {
        let color = type.color()
        Text(text)
            .foregroundColor(color.0)
            .applyFontStyle(.body)
            .frame(width: 67, height: 67)
            .background(color.1)
            .cornerRadius(50)
            .colorShadow(color: color.0)
    }
}
