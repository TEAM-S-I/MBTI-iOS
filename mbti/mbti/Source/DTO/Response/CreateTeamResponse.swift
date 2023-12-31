//
//  CreateTeamResponse.swift
//  mbti
//
//  Created by dgsw8th71 on 12/26/23.
//

struct CreateTeamResponse: Decodable, Hashable {
    let team_name: String
    let members: [MbtiResponse]
}

extension CreateTeamResponse {
    
    func toModel() -> MatchLogTeamModel {
        let model = MatchLogTeamModel()
        model.name = self.team_name
        model.members.append(objectsIn: self.members.map {
            $0.toDTO().toModel()
        })
        return model
    }
}

extension [MbtiResponse] {
    func toDTO() -> [MbtiDTO] {
        self.map {
            $0.toDTO()
        }
    }
}

