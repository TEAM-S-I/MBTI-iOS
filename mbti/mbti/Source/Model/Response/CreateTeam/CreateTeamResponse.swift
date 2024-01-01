//
//  CreateTeamResponse.swift
//  mbti
//
//  Created by dgsw8th71 on 12/26/23.
//

struct CreateTeamResponse: Decodable, Hashable {
    let team_name: String
    let members: [CreateMbtiResponse]
}

extension CreateTeamResponse {
    
    func toDTO() -> MbtiTeamDTO {
        return MbtiTeamDTO(name: self.team_name,
                           members: self.members.map { $0.toDTO() })
    }
}
