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
                
                    Text("Hello 반갑습니다")
                        .font(.title)
                
                    Text("Hello 반갑습니다")
                        .font(.subtitle)
                
                    Text("Hello 반갑습니다")
                        .font(.body)
                
                    Text("Hello 반갑습니다")
                        .font(.label)
                
                    Text("Hello 반갑습니다")
                        .font(.caption)
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
