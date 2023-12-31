//
//  MbtiModel.swift
//  mbti
//
//  Created by dgsw8th71 on 12/21/23.
//

import Foundation


struct MbtiDTO: Hashable, Identifiable {
    var id = UUID()
    let name: String
    let mbti: MbtiType
}

extension MbtiDTO {
    func toModel() -> MatchLogModel {
        let model = MatchLogModel()
        model.name = self.name
        model.mbti = self.mbti.rawValue
        model.desc = nil
        model.role = nil
        return model
    }
}
