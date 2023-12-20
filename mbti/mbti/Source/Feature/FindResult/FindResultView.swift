//
//  FindResultView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/20/23.
//

import SwiftUI

struct FindResultView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let data = Array(repeating: 1, count: 10)
    
    @State var selectedTab = 1
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("당신(MBTI)과 가장 맞는 팀원은 바로...")
                    .applyFontStyle(.body)
                    .padding(.top, geo.size.height / 8)
                TabView(selection: $selectedTab) {
                    ForEach(0..<10) { _ in
                        FindResultCeil()
                            .padding(.horizontal, 12)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 420)
                .shadow1()
                
                HStack(spacing: 6) {
                    ForEach(0..<10) { i in
                        Circle()
                            .fill(i == selectedTab ? Color.main800 : Color.main300)
                            .frame(width: 6, height: 6)
                            
                    }
                }
                .padding(.top, 28)
                
                Spacer()
                MbtiTransparentButton("홈으로") {
                    dismiss()
                }
                .padding(.vertical, 12)
            }
        }
        .addMbtiLogo()
        .addBackButton {
            dismiss()
        }
        .navigationBarBackButtonHidden()
        .background(Color.main100)
    }
}
