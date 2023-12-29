//
//  NormalNameCircle.swift
//  mbti
//
//  Created by dgsw8th71 on 12/29/23.
//

import SwiftUI

struct NormalNameCircle: View {
    
    let model: MbtiModel
    
    var body: some View {
        VStack {
            NameCircle(model.name, type: model.mbti.nameCircleType)
            Text(model.mbti.rawValue)
                .applyFontStyle(.label)
                .foregroundColor(.gray300)
                .padding(.top, 8)
        }
    }
}
