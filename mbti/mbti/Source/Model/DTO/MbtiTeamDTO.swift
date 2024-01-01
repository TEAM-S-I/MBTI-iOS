//
//  MbtiTeamDTO.swift
//  mbti
//
//  Created by dgsw8th71 on 1/1/24.
//

import Foundation

struct MbtiTeamDTO: Hashable {
    
    let name: String
    let members: [MbtiDTO]
    
    func toModel() -> MbtiTeamModel {
        let model = MbtiTeamModel()
        model.name = self.name
        model.members.append(objectsIn: self.members.map { $0.toModel() })
        return model
    }
}
