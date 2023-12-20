//
//  ViewExt.swift
//  mbti
//
//  Created by dgsw8th71 on 12/18/23.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}


extension View {
    func addMbtiLogo() -> some View {
        ZStack {
            self
            VStack {
                HStack {
                    MbtiLogo()
                        .padding(.leading, 20)
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    func addBackButton(callback: @escaping () -> Void) -> some View {
        ZStack {
            self
            VStack {
                HStack {
                    Button {
                        callback()
                    } label: {
                        Image("Back")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    .padding(.leading, 20)
                    .padding(.top, 44)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}
