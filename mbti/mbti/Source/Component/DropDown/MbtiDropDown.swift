//
//  DropDown.swift
//  mbti
//
//  Created by dgsw8th71 on 12/18/23.
//

import SwiftUI

struct MbtiDropDown: View {
    
    @Binding var choicedElement: MbtiType?
    @State var isSelected = false
    
    let type: MbtiDropDownType
    
    init(choicedElement: Binding<MbtiType?>,
         type: MbtiDropDownType = .normal) {
        self._choicedElement = choicedElement
        self.type = type
    }
    
    var body: some View {
        Menu {
            ForEach(MbtiType.allCases, id: \.self) { mbti in
                Button {
                    choicedElement = mbti
                } label: {
                    Text(mbti.rawValue)
                        .applyFontStyle(.body)
                }
            }
        } label: {
            Text("\(choicedElement?.rawValue ?? "MBTI를 선택해 주세요")")
                .foregroundColor(choicedElement == nil ? .main300 : .main800)
                .applyFontStyle(.body)
                .frame(width: 256 - 32, height: 48, alignment: .leading)
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
        }
    }
}
