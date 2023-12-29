//
//  TeamCeil.swift
//  mbti
//
//  Created by dgsw8th71 on 12/29/23.
//

import SwiftUI

struct MatchResultTeamCeil: View {
    
    let teamName: String
    let members: [MbtiModel]
    
    var body: some View {
        VStack {
            Text(teamName)
            HStack {
                ForEach(members, id: \.self) {
                    NormalNameCircle(model: $0)
                }
            }
        }
    }
}
