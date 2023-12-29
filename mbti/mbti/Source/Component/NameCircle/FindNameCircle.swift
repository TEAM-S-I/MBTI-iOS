//
//  FindNameCircle.swift
//  mbti
//
//  Created by dgsw8th71 on 12/29/23.
//

import SwiftUI

struct FindNameCircle: View {
    
    let mbti: MbtiType
    let title: String
    
    var body: some View {
        VStack {
            NameCircle(mbti.rawValue, type: mbti.nameCircleType)
            Text(title)
                .applyFontStyle(.title)
                .foregroundColor(.main800)
                .padding(.top, 8)
        }
    }
}
