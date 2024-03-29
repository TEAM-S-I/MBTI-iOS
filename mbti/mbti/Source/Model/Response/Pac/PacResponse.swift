//
//  PacResponse.swift
//  mbti
//
//  Created by dgsw8th71 on 12/26/23.
//

import Foundation

struct PacResponse: Decodable {
    let team: PacTeamResponse?
}

extension PacResponse {
    func toModel() -> PacDTO {
        PacDTO(team: self.team!.toModel())
    }
}
