//
//  MbtiModel.swift
//  mbti
//
//  Created by dgsw8th71 on 12/21/23.
//

import Foundation


struct MbtiDTO: Hashable, Identifiable {
    var id = UUID()
    var name: String
    var mbti: MbtiType
    var role: String?
    var description: String?
    
    init(id: UUID = UUID(),
         name: String,
         mbti: MbtiType,
         role: String? = nil,
         description: String? = nil
    ) {
        self.id = id
        self.name = name
        self.mbti = mbti
        self.role = role
        self.description = description
    }
}

extension MbtiDTO {
    func toModel() -> MbtiModel {
        let model = MbtiModel()
        model.name = self.name
        model.mbti = self.mbti.rawValue
        model.desc = self.description
        model.role = self.role
        return model
    }
}
