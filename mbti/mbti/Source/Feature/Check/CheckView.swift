//
//  CheckView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/18/23.
//

import SwiftUI

struct CheckView: View {
    var body: some View {
        VStack {
            Text("내 팀의 장단점은 무엇일까?")
                .applyFontStyle(.title)
            Text("MBTI로 알아보는 나의 팀 상태")
                .foregroundColor(.main300)
                .applyFontStyle(.body)
                .padding(.top, 4)
            MbtiButton("팀 진단 시작하기") {
                print("let's start to check")
            }
            .padding(.top, 24)
        }
    }
}
