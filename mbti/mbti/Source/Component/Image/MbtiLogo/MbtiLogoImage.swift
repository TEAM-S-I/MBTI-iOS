//
//  Image.swift
//  mbti
//
//  Created by dgsw8th71 on 12/17/23.
//

import SwiftUI

struct MbtiLogoImage: View {
    
    let type: MbtiLogoType
    let renderingMode: Image.TemplateRenderingMode
    
    init(type: MbtiLogoType,
         renderingMode: Image.TemplateRenderingMode = .original) {
        self.type = type
        self.renderingMode = renderingMode
    }
    
    var body: some View {
        
        let size = type.size()
        
        Image("MbtiLogo")
            .resizable()
            .renderingMode(renderingMode)
            .frame(width: size.0, height: size.1)
    }
}
