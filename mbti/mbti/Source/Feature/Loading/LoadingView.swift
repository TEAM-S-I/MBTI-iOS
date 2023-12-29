//
//  LoadingView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/29/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Circle()
                .background(Color.main800)
                .frame(width: 78, height: 78)
            Text("AI가 최적의 팀을\n만드는 중이에요")
                .applyFontStyle(.title)
                .padding(.top, 52)
        }
    }
}

