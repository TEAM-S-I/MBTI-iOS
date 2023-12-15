//
//  Color.swift
//  mbti
//
//  Created by dgsw8th71 on 12/15/23.
//

import SwiftUI

extension Color {
    
    static let white = Color("FFFFFF")
    static let black = Color("000000")
    static let red = Color("F72416")

    static let main100 = Color( "FFFCF8")
    static let main300 = Color( "DEC4AD")
    static let main800 = Color("453D35")

    static let gray100 = Color("F1F1F1")
    static let gray300 = Color("D0D0D0")
    static let gray500 = Color("AAAAAA")
    static let gray700 = Color("888888")
    static let gray900 = Color("222222")

    static let green200 = Color("CCF3DE")
    static let green500 = Color("4BBF81")

    static let yellow200 = Color("FAEFD4")
    static let yellow500 = Color("F8AB17")

    static let salmon200 = Color("FDD7CB")
    static let salmon500 = Color("F56D42")

    static let blue200 = Color("D4E2FC")
    static let blue500 = Color("487FEA")
    
    
    init(_ hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
