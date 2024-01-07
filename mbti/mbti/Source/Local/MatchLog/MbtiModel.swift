//
//  MatchLogModel.swift
//  mbti
//
//  Created by dgsw8th71 on 12/30/23.
//

import Foundation
import RealmSwift


class MbtiModel: Object, Identifiable {
    @Persisted var name: String = ""
    @Persisted var mbti: String = ""
    @Persisted var role: String? = ""
    @Persisted var desc: String? = ""
}

extension MbtiModel {
    
    private static var realm = try! Realm()
    
    static func findAll() -> Results<MbtiModel> {
        realm.objects(MbtiModel.self)
    }
    
    static func addMatchLog(_ memo: MbtiModel) {
        try! realm.write {
            realm.add(memo)
        }
    }
    
    static func delMatchLog(_ memo: MbtiModel) {
        try! realm.write {
            realm.delete(memo)
        }
    }
    
    static func editMatchLog(matchLog: MbtiModel, 
                             name: String,
                             mbti: String,
                             role: String,
                             desc: String
    ) {
        try! realm.write {
            matchLog.name = name
            matchLog.mbti = mbti
            matchLog.role = role
            matchLog.desc = desc
        }
    }
}

extension MbtiModel {
    func toDto() -> MbtiDTO {
        MbtiDTO(name: self.name,
                mbti: MbtiType.getType(self.mbti)!,
                description: self.desc)
    }
}
