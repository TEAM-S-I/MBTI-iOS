//
//  mbtiApp.swift
//  mbti
//
//  Created by dgsw8th71 on 12/15/23.
//

import SwiftUI

@main
struct mbtiApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Text("test")
                    }
                HomeView()
                    .tabItem {
                        MbtiLogoImage(type: .small)
                    }
                HomeView()
                    .tabItem {
                        MbtiLogoImage(type: .small)
                    }
                
            }
            .tabViewStyle(.page)
        }
    }
}
