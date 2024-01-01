//
//  mbtiApp.swift
//  mbti
//
//  Created by dgsw8th71 on 12/15/23.
//

import SwiftUI
import GoogleMobileAds
import AppTrackingTransparency
import AdSupport

@main
struct mbtiApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .onChange(of: scenePhase) { (newScenePhase) in
            if case .active = newScenePhase {
                initMobileAds()
            }
        }
    }
    
    func initMobileAds() {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        // comment this if you want SDK Crash Reporting:
        GADMobileAds.sharedInstance().disableSDKCrashReporting()
    }
}
