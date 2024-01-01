//
//  FindView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/18/23.
//

import SwiftUI

struct FindView: View {
    
    @State var mbti: MbtiType? = nil
    @State var isWarning = false
    @State var isFindResult = false
    
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
                MbtiDropDown(choicedElement: $mbti)
                    .padding(.top, 24)
                NavigationLink(isActive: $isFindResult) {
                    FindResultView(title: "당신(\(mbti?.rawValue ?? "..."))과 가장 맞는 팀원은 바로...",
                                   findData: mbti?.pacDTO
                    )
                } label: {
                    
                }
                MbtiButton("찾기") {
                    if mbti == nil {
                        isWarning = true
                    } else {
                        isFindResult = true
                    }
                }
                .padding(.top, 8)
                if isWarning && mbti == nil {
                    Text("MBTI를 선택해 주세요")
                        .foregroundColor(.red)
                        .applyFontStyle(.label)
                        .padding(.top, 4)
                }
                
                Spacer()
            }
            Spacer()
        }
        .background(Color.main100)
    }
}
