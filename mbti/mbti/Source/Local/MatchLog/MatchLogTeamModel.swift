//
//  MatchLogTeamModel.swift
//  mbti
//
//  Created by dgsw8th71 on 12/31/23.
//

import Foundation
import RealmSwift


class MatchLogTeamModel: Object {
    @Persisted var name: String
    @Persisted var members: List<MatchLogModel> = List()
}

extension MatchLogTeamModel {
    
    private static var realm = try! Realm()
    
    static func findAll() -> Results<MatchLogTeamModel> {
        realm.objects(MatchLogTeamModel.self)
    }
    
    static func addMatchLog(_ memo: MatchLogTeamModel) {
        try! realm.write {
            realm.add(memo)
        }
    }
    
    static func delMatchLog(_ memo: MatchLogTeamModel) {
        try! realm.write {
            realm.delete(memo)
        }
    }
    
    static func editMatchLog(matchLog: MatchLogTeamModel,
                             name: String,
                             members: List<MatchLogModel>
    ) {
        try! realm.write {
            matchLog.name = name
            matchLog.members = members
        }
    }
}
