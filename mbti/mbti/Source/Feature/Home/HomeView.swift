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
                    
                    Button {
                        print("Hello!")
                    } label: {
                        Text("Hello")
                    }
                    
                    Spacer()
                }
                Spacer()
            }
        }
        .background(Color.main100)
    }
}
