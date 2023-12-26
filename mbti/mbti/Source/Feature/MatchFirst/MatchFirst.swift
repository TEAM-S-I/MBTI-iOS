//
//  MatchFirst.swift
//  mbti
//
//  Created by dgsw8th71 on 12/19/23.
//

import SwiftUI

struct MatchFirst: View {
    
    @Environment(\.dismiss) private var dismiss
    @State var isAddActive = false
    @State var name = ""
    
    var data: [MbtiModel] = [
        MbtiModel(name: "한준혁", mbti: .isfp),
        MbtiModel(name: "양예성", mbti: .estp),
        MbtiModel(name: "박병준", mbti: .infp),
        MbtiModel(name: "이강현", mbti: .entp)
    ]
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Text("매칭할 팀원을 추가해 주세요")
                        .applyFontStyle(.title)
                        .padding(.top, 100)
                    MbtiGrid(data: data) {
                        isAddActive = true
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
            if isAddActive {
                MbtiDialog(isActive: $isAddActive) {
                    Text("팀원 정보 입력")
                        .applyFontStyle(.subtitle)
                        .padding(.leading, 4)
                        .toLeading()
                    MbtiTextField("이름을 입력해 주세요", text: $name, type: .topRadius)
                        .padding(.top, 12)
                    MbtiDropDown(type: .bottomRadius)
                    MbtiTransparentButton("추가 완료", fontStyle: .body) {
                        print("complete to add")
                        isAddActive = false
                    }
                    .padding(.top, 16)
                    .padding(.bottom, 4)
                }
            }
        }
        
    }
}
