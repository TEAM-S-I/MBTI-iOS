//
//  MatchLogModel.swift
//  mbti
//
//  Created by dgsw8th71 on 12/30/23.
//

import Foundation
import RealmSwift


class MatchLogModel: Object {
    @Persisted var name: String = ""
    @Persisted var mbti: String = ""
    @Persisted var role: String = ""
    @Persisted var desc: String = ""
}

extension MatchLogModel {
    private static var realm = try! Realm()
    
    static func findAll() -> Results<MatchLogModel> {
        realm.objects(MatchLogModel.self)
    }
    
    static func addMatchLog(_ memo: MatchLogModel) {
        try! realm.write {
            realm.add(memo)
        }
    }
    
    static func delMatchLog(_ memo: MatchLogModel) {
        try! realm.write {
            realm.delete(memo)
        }
    }
    
    static func editMatchLog(matchLog: MatchLogModel, 
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
