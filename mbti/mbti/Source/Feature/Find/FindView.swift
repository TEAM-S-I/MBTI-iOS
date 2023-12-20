//
//  FindView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/18/23.
//

import SwiftUI

struct FindView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 0) {
                Spacer()
                Text("팀플할 때 나랑 맞는 MBTI는?")
                    .applyFontStyle(.title)
                Text("자신의 MBTI를 입력해 보세요")
                    .foregroundColor(.main300)
                    .applyFontStyle(.body)
                MbtiDropDown()
                    .padding(.top, 24)
                NavigationLink {
                    FindResultView()
                } label: {
                    MbtiButton("찾기") {
                        print("find")
                    }
                    .disabled(true)
                }
                .padding(.top, 8)
                Spacer()
            }            
            Spacer()
        }
        .background(Color.main100)
        .ignoresSafeArea()
    }
}
