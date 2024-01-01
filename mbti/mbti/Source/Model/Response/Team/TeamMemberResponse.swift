//
//  TeamMemberResponse.swift
//  mbti
//
//  Created by dgsw8th71 on 12/26/23.
//

import Foundation

struct TeamMemberResponse: Decodable {
    let name: String
    let mbti: String
    let role: String
    let description: String
}

extension TeamMemberResponse {
    func toDTO() -> MbtiDTO {
        MbtiDTO(name: self.name,
                mbti: MbtiType.getType(self.mbti) ?? .enfj,
                role: self.role,
                description: self.description)
    }
}
