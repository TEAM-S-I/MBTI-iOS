//
//  SettingCeil.swift
//  mbti
//
//  Created by dgsw8th71 on 1/30/24.
//

import SwiftUI

struct SettingCeil: View {
    
    let title: String
    let description: String
    
    init(title: String,
         description: String = ""
    ) {
        self.title = title
        self.description = description
    }
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(Color.black)
                .font(.body)
                .padding(.leading, 24)
            Spacer()
            if description.isEmpty {
                Image("Front")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 24)
            } else {
                Text(description)
                    .foregroundStyle(Color.black)
                    .font(.body)
                    .padding(.trailing, 24)
            }
        }
        .frame(height: 48)
    }
}
