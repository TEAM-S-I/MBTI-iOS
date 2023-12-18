//
//  LaunchView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/18/23.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                MbtiLogoImage(type: .big)
                Text("팀 매칭")
                    .applyFontStyle(.title)
                    .padding(.top, 8)
                Spacer()
            }
            Spacer()
        }
        .background(Color.main100)
    }
}
