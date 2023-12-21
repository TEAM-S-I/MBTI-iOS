//
//  DialogTest.swift
//  mbti
//
//  Created by dgsw8th71 on 12/21/23.
//

import SwiftUI

struct DialogTest: View {
    @State private var showDialog = true
    @State private var showDialog2 = true
    
    var body: some View {
        VStack {
            Button {
                withAnimation(.easeOut(duration: 0.3)) {
                    showDialog = true
                }
            } label: {
                Text("Item test1")
            }
            Button {
                showDialog2 = true
            } label: {
                Text("Item test2")
            }
        }.customDialog(isShowing: $showDialog) {
            VStack {
                Text("Dialog title")
                    .fontWeight(.bold)
                Divider()
                Text("Some longer description")
                    .padding(.bottom, 10)
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        showDialog = false
                    }
                }) {
                    Text("Close dialog")
                        .autocapitalization(.allCharacters)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                }
            }.padding(16)
        }
        .alert("test", isPresented: $showDialog2) {
            Button("OK") {
                
            }
        } message: {
            Text("it's test.")
        }
    }
}
