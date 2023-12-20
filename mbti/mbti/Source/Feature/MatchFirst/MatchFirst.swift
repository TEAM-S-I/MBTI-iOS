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
                        ForEach((0..<7), id: \.self) { _ in
                            VStack {
                                NameCircle("한준혁", type: .yellow)
                                Text("ISFP")
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
                MbtiTransparentButton("다음 단계로") {
                    print("NextLevel")
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
