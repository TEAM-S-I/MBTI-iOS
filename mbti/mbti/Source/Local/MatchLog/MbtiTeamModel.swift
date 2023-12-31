//
//  MatchLogTeamModel.swift
//  mbti
//
//  Created by dgsw8th71 on 12/31/23.
//

import Foundation
import RealmSwift


class MbtiTeamModel: Object {
    @Persisted var name: String
    @Persisted var members: List<MbtiModel> = List()
}

extension MbtiTeamModel {
    
    private static var realm = try! Realm()
    
    static func findAll() -> Results<MbtiTeamModel> {
        realm.objects(MbtiTeamModel.self)
    }
    
    static func addMatchLog(_ memo: MbtiTeamModel) {
        try! realm.write {
            realm.add(memo)
        }
    }
    
    static func delMatchLog(_ memo: MbtiTeamModel) {
        try! realm.write {
            realm.delete(memo)
        }
    }
    
    static func editMatchLog(matchLog: MbtiTeamModel,
                             name: String,
                             members: List<MbtiModel>
    ) {
        try! realm.write {
            matchLog.name = name
            matchLog.members = members
        }
    }
}
