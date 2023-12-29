//
//  CompleteView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/29/23.
//

import SwiftUI

struct CompleteView: View {
    
    @State var opacity: Double = 0
    
    var body: some View {
        VStack {
            Image("Check")
                .resizable()
                .frame(width: 78, height: 78)
            Text("MBTI 팀 매칭이 완료되었습니다\n")
                .applyFontStyle(.title)
                .padding(.top, 52)
        }
        .opacity(opacity)
        .onAppear {
            withAnimation {
                opacity = 1
            }
        }
        .onDisappear {
            withAnimation {
                opacity = 0
            }
        }
    }
}
