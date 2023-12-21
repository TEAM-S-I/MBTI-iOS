//
//  Constant.swift
//  mbti
//
//  Created by dgsw8th71 on 12/18/23.
//

import SwiftUI

enum MbtiType: String, CaseIterable {
    case istp = "ISTP"
    case istj = "ISTJ"
    case isfp = "ISFP"
    case isfj = "ISFJ"
    case intp = "INTP"
    case intj = "INTJ"
    case infp = "INFP"
    case infj = "INFJ"
    case estp = "ESTP"
    case estj = "ESTJ"
    case esfp = "ESFP"
    case esfj = "ESFJ"
    case entp = "ENTP"
    case entj = "ENTJ"
    case enfp = "ENFP"
    case enfj = "ENFJ"
    
    var nameCircleType: NameCircleType {
        get {
            let mid = self.rawValue[1...2]
            switch mid {
            case "ST":
                return .salmon
            case "SF":
                return .yellow
            case "NT":
                return .blue
            case "NF":
                return .green
            default:
                return .blue
            }
        }
    }
}
