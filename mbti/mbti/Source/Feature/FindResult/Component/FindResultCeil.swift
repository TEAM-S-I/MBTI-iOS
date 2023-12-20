//
//  FindResultCeil.swift
//  mbti
//
//  Created by dgsw8th71 on 12/20/23.
//

import SwiftUI

struct FindResultCeil: View {
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
            VStack(spacing: 0) {
                NameCircle("MBTI", type: .green)
                    .padding(.top, 24)
                Text("타고난 리더")
                    .applyFontStyle(.title)
                    .padding(.top, 8)
                
                Text("MBTI와 이런 부분들이 잘 맞아요!")
                    .applyFontStyle(.subtitle)
                    .padding(.leading, 20)
                    .padding(.top, 32)
                    .toLeading()
                Text("리더십 능력이 뛰어나며\n목표 달성을 위해\n효과적으로 계획하고 실행할 수 있습니다")
                    .foregroundColor(.main300)
                    .applyFontStyle(.body)
                    .padding(.top, 12)
                    .padding(.leading, 16)
                    .toLeading()
                Text("MBTI와 보완해야 할 것들이에요")
                    .applyFontStyle(.subtitle)
                    .padding(.leading, 20)
                    .padding(.top, 72)
                    .toLeading()
                Text("다소 고집이 세고 강한 성향으로 인해\n다른 의견을 수용하는 데 어려움이 있을 수 있습니다")
                    .foregroundColor(.main300)
                    .applyFontStyle(.body)
                    .toLeading()
                    .padding(.top, 12)
                    .padding(.leading, 16)
                    .padding(.bottom, 54)
            }
            Spacer()
        }
        .background(Color.main100)
        .cornerRadius(16)
    }
}
