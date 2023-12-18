//
//  DropDown.swift
//  mbti
//
//  Created by dgsw8th71 on 12/18/23.
//

import SwiftUI

struct MbtiDropDown: View {
    
    @State var choicedElement = MbtiType.allCases[0]
    let type: MbtiDropDownType
    
    init(type: MbtiDropDownType = .normal) {
        self.type = type
    }
    
    var body: some View {
        Menu {
            Picker(selection: $choicedElement, label: Text("Test")) {
                ForEach(MbtiType.allCases, id: \.self) { mbti in
                    Button {
                        choicedElement = mbti
                    } label: {
                        Text(mbti.rawValue).applyFontStyle(.body)
                    }
                }
            }
        } label: {
            Text("\(choicedElement.rawValue)")
                .frame(width: 256, height: 48, alignment: .leading)
                .background(Color.main100)
                .padding(.horizontal, 16)
                .cornerRadius(8)
                .overlay(
                    RoundedCorner(radius: 8, corners: type.corner)
                        .stroke(Color.main300, lineWidth: 1)
                )
                .overlay(
                    HStack {
                        Spacer()
                        Image("DropDown")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.trailing, 12)
                    }
                )
                .font(.body)
                .accentColor(.main300)
                .foregroundColor(.main800)
        }
    }
}
