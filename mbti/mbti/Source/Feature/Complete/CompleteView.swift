//
//  CompleteView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/29/23.
//

import SwiftUI

struct CompleteView: View {
    var body: some View {
        VStack {
            Circle()
                .background(Color.main800)
                .frame(width: 78, height: 78)
            Text("MBTI 팀 매칭이 완료되었습니다\n")
                .applyFontStyle(.title)
                .padding(.top, 52)
        }
    }
}
