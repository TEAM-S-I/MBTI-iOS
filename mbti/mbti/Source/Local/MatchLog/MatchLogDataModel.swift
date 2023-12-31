//
//  MatchLogDataModel.swift
//  mbti
//
//  Created by dgsw8th71 on 12/31/23.
//

import Foundation
import RealmSwift

class MatchLogDataModel: Object, Identifiable {
    @Persisted var data: List<MatchLogTeamModel>
}

extension MatchLogDataModel {
    private static var realm = try! Realm()
    
    static func findAll() -> Results<MatchLogDataModel> {
        realm.objects(MatchLogDataModel.self)
    }
    
    static func addMatchLog(_ memo: MatchLogDataModel) {
        try! realm.write {
            realm.add(memo)
        }
    }
    
    static func delMatchLog(_ memo: MatchLogDataModel) {
        try! realm.write {
            realm.delete(memo)
        }
    }
    
    static func editMatchLog(matchLog: MatchLogDataModel,
                             data: List<MatchLogTeamModel>
    ) {
        try! realm.write {
            matchLog.data = data
        }
    }
}

