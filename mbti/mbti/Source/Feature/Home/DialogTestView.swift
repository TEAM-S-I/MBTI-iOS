//
//  DialogTestView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/26/23.
//

import SwiftUI

struct DialogTestView: View {
    @State var isActive: Bool = false
    @State var text: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                Button {
                    isActive = true
                } label: {
                    Text("Show popup")
                }
            }
            .padding()
            
            if isActive {
                CustomDialog(isActive: $isActive) {
                    
                    Text("Hello World!")
                        .applyFontStyle(.title)
                        .toLeading()
                    MbtiTextField("id", text: $text, type: .topRadius)
                    MbtiDropDown(type: .bottomRadius)
                }
            }
        }
    }
}
