//
//  DropDown.swift
//  mbti
//
//  Created by dgsw8th71 on 12/18/23.
//

import SwiftUI

struct MbtiDropDown: View {
    
    @State var choicedElement = MbtiType.allCases[0].rawValue
    
    var body: some View {
        Menu {
//            Picker()
            ForEach(MbtiType.allCases, id: \.self) { mbti in
                Button {
                    choicedElement = mbti.rawValue
                } label: {
                    Text(mbti.rawValue).applyFontStyle(.body)
                }
            }
            
            
        } label: {
            Text("\(choicedElement)")
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
}
