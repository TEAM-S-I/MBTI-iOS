//
//  NameCircleType.swift
//  mbti
//
//  Created by dgsw8th71 on 12/17/23.
//

import SwiftUI

enum NameCircleType {
    case green
    case blue
    case yellow
    case salmon
    
    func color() -> (Color, Color) {
        switch self {
        case .green:
            (Color.green500, Color.green200)
        case .blue:
            (Color.blue500, Color.blue200)
        case .yellow:
            (Color.yellow500,Color.yellow200)
        case .salmon:
            (Color.salmon500, Color.salmon200)
        }
    }
    
}
