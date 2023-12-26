//
//  PlanMemberResponse.swift
//  mbti
//
//  Created by dgsw8th71 on 12/26/23.
//

import Foundation

struct PlanMemberResponse: Decodable {
    let name: String
    let mbti: String
}

extension PlanMemberResponse {
    func toModel() -> MbtiModel {
        return MbtiModel(name: self.name, mbti: MbtiType.getType(self.mbti) ?? .enfj)
    }
}
