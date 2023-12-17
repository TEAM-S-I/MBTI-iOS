//
//  HomeView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/15/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader { geo in
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    
                    NameCircle("이진수", type: .blue)
                    NameCircle("이진수", type: .yellow)
                    NameCircle("이진수", type: .salmon)
                    NameCircle("이진수", type: .green)
                    AddCircleButton {
                        print("click add circle button")
                    }
                    MbtiButton("Test") {
                        print("Hello World!")
                    }
                    MbtiTransparentButton("Test") {
                        
                    }
                    
                    MbtiLogoImage(type: .small, renderingMode: .template)
                        .foregroundColor(Color.main300)
                    MbtiLogoImage(type: .normal)
                    MbtiLogoImage(type: .big)
                
                    Text("Hello 반갑습니다")
                        .foregroundColor(Color.main300)
                        .applyFontStyle(.title)
                
                    Text("Hello 반갑습니다")
                        .applyFontStyle(.subtitle)
                
                    Text("Hello 반갑습니다")
                        .applyFontStyle(.body)
                
                    Text("Hello 반갑습니다")
                        .applyFontStyle(.label)
                
                    Text("Hello 반갑습니다")
                        .applyFontStyle(.caption)
                    Spacer()
                }
                Spacer()
            }
        }
        .background(Color.main100)
        .onAppear {
            for family: String in UIFont.familyNames {
                print(family)
                for names: String in UIFont.fontNames(forFamilyName: family) {
                    print("=== \(names)")
                }
            }
        }
    }
}
