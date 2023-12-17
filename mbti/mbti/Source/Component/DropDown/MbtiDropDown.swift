//
//  DropDown.swift
//  mbti
//
//  Created by dgsw8th71 on 12/18/23.
//

import SwiftUI

struct MbtiDropDown: View {
    
    @State var choicedElement = 0
    
    var body: some View {
        Menu {
            Button {
                choicedElement = 0
            } label: {
                Text("0").applyFontStyle(.body)
            }
            Button {
                choicedElement = 1
            } label: {
                Text("1").applyFontStyle(.body)
            }
            Button {
                choicedElement = 2
            } label: {
                Text("2").applyFontStyle(.body)
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
