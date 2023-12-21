//
//  MatchFirst.swift
//  mbti
//
//  Created by dgsw8th71 on 12/19/23.
//

import SwiftUI

struct MatchFirst: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var columns: [GridItem] = Array(repeating: .init(.flexible(maximum: 67 + 8)), count: 3)
    
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
                Text("매칭할 팀원을 추가해 주세요")
                    .applyFontStyle(.title)
                    .padding(.top, 100)
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(data, id: \.self) { model in
                            VStack {
                                NameCircle(model.name, type: model.mbti.nameCircleType)
                                Text(model.mbti.rawValue)
                                    .applyFontStyle(.label)
                                    .foregroundColor(.gray300)
                                    .padding(.top, 8)
                            }
                        }
                        VStack {
                            AddCircleButton {
                                
                            }
                            Text("")
                                .applyFontStyle(.label)
                                .foregroundColor(.gray300)
                                .padding(.top, 8)
                        }
                    }
                    .padding(.horizontal)
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
