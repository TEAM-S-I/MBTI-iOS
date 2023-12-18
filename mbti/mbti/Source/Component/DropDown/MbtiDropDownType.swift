//
//  MbtiDropDownType.swift
//  mbti
//
//  Created by dgsw8th71 on 12/18/23.
//

import SwiftUI

enum MbtiDropDownType {
    case normal
    case topRadius
    case bottomRadius
    
    var corner: UIRectCorner {
        get {
            switch self {
            case .normal:
                [UIRectCorner.allCorners]
            case .topRadius:
                [UIRectCorner.topLeft, UIRectCorner.topRight]
            case .bottomRadius:
                [UIRectCorner.bottomLeft, UIRectCorner.bottomRight]
            }
        }
    }
}
