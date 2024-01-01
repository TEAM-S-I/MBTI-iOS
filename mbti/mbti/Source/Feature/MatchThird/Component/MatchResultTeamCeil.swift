//
//  TeamCeil.swift
//  mbti
//
//  Created by dgsw8th71 on 12/29/23.
//

import SwiftUI

struct MatchResultTeamCeil: View {
    
    let teamName: String
    let members: [MbtiDTO]
    let callback: (MbtiDTO) -> Void
    
    init(teamName: String, 
         members: [MbtiDTO],
         callback: @escaping (MbtiDTO) -> Void) {
        self.teamName = teamName
        self.members = members
        self.callback = callback
    }
    
    var body: some View {
        VStack {
            Text(teamName)
                .applyFontStyle(.subtitle)
            HStack {
                ForEach(members, id: \.self) { i in
                    Button {
                        callback(i)
                    } label: {
                        NormalNameCircle(model: i)
                    }
                }
            }
        }
    }
}
