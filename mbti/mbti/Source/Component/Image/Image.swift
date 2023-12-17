//
//  Image.swift
//  mbti
//
//  Created by dgsw8th71 on 12/17/23.
//

import SwiftUI

struct MbtiLogoImage: View {
    
    let type: MbtiLogoType
    
    var body: some View {
        
        Image("MbtiLogo")
            .resizable()
            .frame(width: type.width(), height: type.height())
    }
}


enum MbtiLogoType {
    case small
    case big
    
    func width() -> CGFloat {
        switch self {
        case .small:
            88
        case .big:
            108
        }
    }
    
    func height() -> CGFloat {
        switch self {
        case .small :
            31
        case .big :
            38
    }
    
}
