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
            MatchResultView(sliderValue: .constant(0), data: .constant([]))
        }
    }
}
