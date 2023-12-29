//
//  HomeNavigationCeil.swift
//  mbti
//
//  Created by dgsw8th71 on 12/29/23.
//

import SwiftUI

struct HomeNavigationCeilView: View {
    
    let image: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .frame(width: 24, height: 24)
                .foregroundColor(isSelected ? .main800 : .main300)
            Rectangle()
                .foregroundColor(isSelected ? .main800 : .main100)
                .frame(width: 24, height: 4)
                .cornerRadius(2)
                .padding(.top, 4)
        }
    }
}
