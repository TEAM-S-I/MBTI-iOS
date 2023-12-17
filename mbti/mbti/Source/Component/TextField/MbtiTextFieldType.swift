//
//  MbtiTextFieldType.swift
//  mbti
//
//  Created by dgsw8th71 on 12/17/23.
//

import SwiftUI

enum MbtiTextFieldType {
    case normal
    case topRadius
    case bottomRadius
    
    func radius() -> (CGFloat, CGFloat, CGFloat, CGFloat) {
        switch self {
        case .normal:
            (8, 8, 8, 8)
        case .topRadius:
            (8, 8, 0, 0)
        case .bottomRadius:
            (0, 0, 8, 8)
        }
    }
}
