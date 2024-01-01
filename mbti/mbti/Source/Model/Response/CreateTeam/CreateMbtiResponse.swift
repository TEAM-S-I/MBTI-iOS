//
//  MbtiResponse.swift
//  mbti
//
//  Created by dgsw8th71 on 12/26/23.
//

struct CreateMbtiResponse: Decodable, Hashable {
    let name: String
    let mbti: String
}

extension CreateMbtiResponse {
    
    func toDTO() -> MbtiDTO {
        return MbtiDTO(name: self.name, mbti: MbtiType.getType(self.mbti) ?? .enfj)
    }
}
