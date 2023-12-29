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

extension [MbtiResponse] {
    func toModel() -> [MbtiModel] {
        self.map {
            $0.toModel()
        }
    }
}
