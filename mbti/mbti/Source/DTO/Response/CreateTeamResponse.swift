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
    
    func toModel() -> MbtiTeamModel {
        let model = MbtiTeamModel()
        model.name = self.team_name
        model.members.append(objectsIn: self.members.map {
            $0.toDTO().toModel()
        })
        return model
    }
}
