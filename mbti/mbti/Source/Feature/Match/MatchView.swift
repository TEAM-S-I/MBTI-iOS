//
//  MatchView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/15/23.
//

import SwiftUI

struct MatchView: View {
    var body: some View {
        VStack(spacing: 0) {
            MbtiLogoImage(type: .normal)
            Text("팀 매칭")
                .applyFontStyle(.title)
                .padding(.top, 12)
            MbtiButton("MBTI 팀 매칭 시작") {
                print("start")
            }
            .padding(.top, 32)
            Button {
                print("match log")
            } label: {
                Text("매칭 기록 보기")
                    .foregroundColor(.gray500)
                    .applyFontStyle(.label)
                    .underline()
            }
            .padding(.top, 24)
        }
    }
}
