//
//  MatchView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/15/23.
//

import SwiftUI

struct MatchView: View {
    
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 0) {
                Spacer()
                MbtiLogoImage(type: .normal)
                Text("팀 매칭")
                    .applyFontStyle(.title)
                    .padding(.top, 12)
                NavigationLink {
                    MatchFirst()
                } label: {
                    MbtiButton("MBTI 팀 매칭 시작") {
                    }
                    .disabled(true)
                    .padding(.top, 32)
                }
                
                NavigationLink {
                    MatchLogView()
                } label: {
                    Button {
                        print("match log")
                    } label: {
                        Text("매칭 기록 보기")
                            .foregroundColor(.gray500)
                            .applyFontStyle(.label)
                            .underline()
                    }
                    .disabled(true)
                    .padding(.top, 24)
                }
                
                Spacer()
            }
            Spacer()
        }
    }
}
