//
//  Text.swift
//  mbti
//
//  Created by dgsw8th71 on 12/15/23.
//

import SwiftUI

extension Font {
    static let title = Font.custom(GangwonEduAllFontFamily.bold.rawValue, size: 22)
    static let subtitle = Font.custom(GangwonEduAllFontFamily.bold.rawValue, size: 18)
    static let body = Font.custom(GangwonEduAllFontFamily.bold.rawValue, size: 14)
    static let label = Font.custom(GangwonEduAllFontFamily.light.rawValue, size: 12)
    static let caption = Font.custom(GangwonEduAllFontFamily.light.rawValue, size: 10)
    
}

enum GangwonEduAllFontFamily: String {
    case bold = "GangwonEduAll-OTFBold"
    case light = "GangwonEduAll-OTFLight"
}


