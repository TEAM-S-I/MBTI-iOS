//
//  PacTeamResponse.swift
//  mbti
//
//  Created by dgsw8th71 on 1/1/24.
//

import Foundation

struct PacTeamResponse: Decodable {
    let members: [PacMemberResponse]
}

extension PacTeamResponse {
    func toModel() -> PacTeamDTO {
        PacTeamDTO(members: self.members.map {
            $0.toModel()
        })
    }
}
