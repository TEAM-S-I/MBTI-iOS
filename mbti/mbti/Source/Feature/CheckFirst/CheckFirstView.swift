//
//  CheckFirstView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/22/23.
//

import SwiftUI

struct CheckFirstView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var data: [MbtiModel] = [
        MbtiModel(name: "한준혁", mbti: .isfp),
        MbtiModel(name: "양예성", mbti: .estp),
        MbtiModel(name: "박병준", mbti: .infp),
        MbtiModel(name: "이강현", mbti: .entp)
    ]
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Text("진단할 팀원을 추가해 주세요")
                    .applyFontStyle(.title)
                    .padding(.top, 100)
                MbtiGrid(data: data) {
                    
                }
                    .padding(.top, 64)
                Spacer()
                NavigationLink {
                    MatchSecondView()
                } label: {
                    MbtiTransparentButton("다음 단계로") {
                        
                    }
                    .disabled(true)
                }
                .padding(.vertical, 12)
            }
            Spacer()
        }
        .addMbtiLogo()
        .addBackButton {
            dismiss()
        }
        .navigationBarBackButtonHidden()
        .background(Color.main100)
    }
}
