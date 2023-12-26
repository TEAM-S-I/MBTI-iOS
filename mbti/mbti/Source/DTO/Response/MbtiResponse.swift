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
        let mbtiType = MbtiType.allCases.filter { i in
            i.rawValue == self.mbti
        }[0]
        
        return MbtiModel(name: self.name, mbti: mbtiType)
    }
}

