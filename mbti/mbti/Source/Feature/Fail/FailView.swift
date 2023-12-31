//
//  FailView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/29/23.
//

import SwiftUI

struct FailView: View {
    @State var opacity: Double = 0
    @Environment(\.dismiss) private var dismiss
    let title: String
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Image("X")
                        .resizable()
                        .frame(width: 78, height: 78)
                    Text(title)
                        .applyFontStyle(.title)
                        .padding(.top, 52)
                    Spacer()
                }
                Spacer()
                
            }
            VStack {
                Spacer()
                MbtiTransparentButton("다시 시도하기") {
                    dismiss()
                }
                .padding(.vertical, 12)
            }
        }
        .addMbtiLogo()
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
