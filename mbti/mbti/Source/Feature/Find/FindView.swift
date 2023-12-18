//
//  FindView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/18/23.
//

import SwiftUI

struct FindView: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("팀플할 때 나랑 맞는 MBTI는?")
                .applyFontStyle(.title)
            Text("자신의 MBTI를 입력해 보세요")
                .foregroundColor(.main300)
                .applyFontStyle(.body)
            MbtiDropDown()
                .padding(.top, 24)
            MbtiButton("찾기") {
                print("find")
            }
            .padding(.top, 8)
            
        }
    }
}
