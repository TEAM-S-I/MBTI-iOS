//
//  MatchLogDataModel.swift
//  mbti
//
//  Created by dgsw8th71 on 12/31/23.
//

import Foundation
import RealmSwift

class MbtiMatchModel: Object {
    @Persisted(primaryKey: true) var objectID: ObjectId
    @Persisted var name: String
    @Persisted var data: List<MbtiTeamModel>
}

extension MbtiMatchModel {
    private static var realm = try! Realm()
    
    static func findAll() -> Results<MbtiMatchModel> {
        realm.objects(MbtiMatchModel.self)
    }
    
    static func addMatchLog(_ memo: MbtiMatchModel) {
        try! realm.write {
            realm.add(memo)
        }
    }
    
    static func delMatchLog(_ memo: MbtiMatchModel) {
        try! realm.write {
            realm.delete(memo)
        }
    }
    
    static func delAll() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    static func editMatchLog(matchLog: MbtiMatchModel,
                             data: List<MbtiTeamModel>
    ) {
        try! realm.write {
            matchLog.data = data
        }
    }
}

