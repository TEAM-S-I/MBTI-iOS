//
//  LoadingView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/29/23.
//

import SwiftUI

struct LoadingView: View {
    
    @State var opacity: Double = 0
    
    let title: String
    
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(.main800)
                .frame(width: 78, height: 78)
            Text(title)
                .applyFontStyle(.title)
                .padding(.top, 52)
        }
        .opacity(opacity)
        .onAppear {
            withAnimation {
                opacity = 1
            }
        }
        .onDisappear {
            withAnimation {
                opacity = 0
            }
        }
    }
}

