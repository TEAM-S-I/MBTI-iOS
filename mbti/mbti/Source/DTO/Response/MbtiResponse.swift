//
//  MbtiResponse.swift
//  mbti
//
//  Created by dgsw8th71 on 12/26/23.
//

struct MbtiResponse: Decodable {
    let name: String
    let mbti: String
}

extension MbtiResponse {
    func toModel() -> MbtiModel {
        return MbtiModel(name: self.name, mbti: MbtiType.getType(self.mbti) ?? .enfj)
    }
}

