//
//  MbtiLogoType.swift
//  mbti
//
//  Created by dgsw8th71 on 12/17/23.
//

import SwiftUI

enum MbtiLogoType {
    case small
    case normal
    case big
    
    func size() -> (CGFloat, CGFloat) {
        switch self {
        case .small:
            (46, 16)
        case .normal:
            (88, 31)
        case .big:
            (108, 38)
        }
    }
    
}
