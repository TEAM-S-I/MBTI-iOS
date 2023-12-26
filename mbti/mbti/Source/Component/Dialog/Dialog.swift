//
//  Dialog.swift
//  mbti
//
//  Created by dgsw8th71 on 12/21/23.
//
import SwiftUI

struct MbtiDialog<DC>: View where DC: View {
    
    @Binding var isActive: Bool
    var isCloseButton: Bool

    @ViewBuilder
    let content: () -> DC
    
    @State private var offset: CGFloat = 20
    @State private var opacity = 0.0
    
    init(isActive: Binding<Bool>, 
         isCloseButton: Bool = true,
         @ViewBuilder content: @escaping () -> DC) {
        self._isActive = isActive
        self.isCloseButton = isCloseButton
        self.content = content
    }

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color(.black)
                    .opacity(0.5)
                    .onTapGesture {
                        close()
                        isActive = false
                    }

                VStack(spacing: 0) {
                    content()
                }
                .padding(16)
                .background(Color.main100)
                .cornerRadius(12)
                .fixedSize(horizontal: true, vertical: false)
                .overlay(alignment: .topTrailing) {
                    if isCloseButton {
                        Button {
                            close()
                            isActive = false
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 13, height: 13)
                                .font(.title2)
                                
                        }
                        .tint(.black)
                        .padding(16)
                    }
                    
                }
                .shadow1()
                .offset(x: 0, y: offset)
                .onAppear {
                    print("Hello")
                    withAnimation(.easeInOut(duration: 0.1)) {
                        offset = 0
                        opacity = 1
                    }
                }
            }
            .opacity(opacity)
            .ignoresSafeArea()
        }
        
    }

    func close() {
        withAnimation(.easeInOut(duration: 0.1)) {
            offset = 20
            opacity = 0
        }
    }
}
