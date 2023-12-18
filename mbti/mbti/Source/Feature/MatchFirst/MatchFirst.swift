//
//  MatchFirst.swift
//  mbti
//
//  Created by dgsw8th71 on 12/19/23.
//

import SwiftUI

struct MatchFirst: View {
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Spacer()
                Text("매칭할 팀원을 추가해 주세요")
                    .applyFontStyle(.title)
                    .padding(.top, 100)
                Spacer()
            }
            Spacer()
        }
        .background(Color.main100)
        
    }
}
