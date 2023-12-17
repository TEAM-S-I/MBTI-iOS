//
//  Shadow.swift
//  mbti
//
//  Created by dgsw8th71 on 12/17/23.
//

import SwiftUI

extension View {
    func shadow1() -> some View {
        self.shadow(
            color: Color("#1C1009").opacity(0.04),
            radius: 20,
            y: 6
        )
    }
    
    func shadow2() -> some View {
        self.shadow(
            color: Color("#241708").opacity(0.04),
            radius: 20,
            y: -8
        )
    }
    
    func colorShadow(color: Color) -> some View {
        self.shadow(
            color: color.opacity(0.15),
            radius: 8,
            y: 4
        )
    }
}
