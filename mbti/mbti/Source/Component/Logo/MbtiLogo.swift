//
//  Logo.swift
//  mbti
//
//  Created by dgsw8th71 on 12/17/23.
//

import SwiftUI

struct MbtiLogo: View {
    var body: some View {
        HStack(spacing: 4) {
            MbtiLogoImage(type: .small, renderingMode: .template)
                .foregroundColor(.main300)
            
            Text("팀 매칭")
                .foregroundColor(.main300)
                .applyFontStyle(.body)
        }
    }
}

