//
//  MatchSecondView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/20/23.
//

import SwiftUI

struct MatchSecondView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                VStack {
                    Text("총 N명이시네요!")
                        .applyFontStyle(.title)
                        .padding(.top, 100)
                        .padding(.top, 64)
                    Text("마지막으로 팀 당 인원을 정해주세요")
                        .applyFontStyle(.title)
                        .padding(.top, 100)
                        .padding(.top, 64)
                }
                 
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

       
