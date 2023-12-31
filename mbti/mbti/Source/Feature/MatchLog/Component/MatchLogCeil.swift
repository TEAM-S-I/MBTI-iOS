//
//  MatchLogCeil.swift
//  mbti
//
//  Created by dgsw8th71 on 12/30/23.
//

import SwiftUI

struct MatchLogCeil: View {
    
    let model: MatchLogDataModel
    let callback: () -> Void
    
    var body: some View {
        
        var s = 0
        
        let _ = {
            for i in model.data {
                s += i.members.count
            }
        }()
        
        Button {
            callback()
        } label: {
            VStack(spacing: 0) {
                Text("총 \(s)명 \(model.data.count)팀")
                    .applyFontStyle(.body)
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .toLeading()
                HStack {
                    Text(model.name)
                        .applyFontStyle(.subtitle)
                    Spacer()
                    Image("Front")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .padding(16)
            }
            .cornerRadius(16)
            .frame(width: 256)
            .background(Color.main100)
            .shadow1()
        }
    }
}
