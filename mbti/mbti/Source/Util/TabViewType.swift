//
//  TabViewType.swift
//  mbti
//
//  Created by dgsw8th71 on 12/18/23.
//

enum TabViewType: String, CaseIterable {
    case match = "match"
    case find = "find"
    case check = "check"
    
    var image: String {
        get {
            switch self {
            case .match:
                return "Team"
            case .find:
                return "Find"
            case .check:
                return "Check1"
            }
        }
    }
}
