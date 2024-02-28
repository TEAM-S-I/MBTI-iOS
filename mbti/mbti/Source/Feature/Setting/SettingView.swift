//
//  SettingView.swift
//  mbti
//
//  Created by dgsw8th71 on 1/30/24.
//

import SwiftUI
import GoogleMobileAds


struct SettingView: View {
    
    private let settings = [
        Setting("개인정보 약관", link: ""),
        Setting("서비스 이용정책", link: ""),
        Setting("버전", description: "v1.0")
    ]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            VStack {
                ForEach(settings, id: \.self) { i in
                    SettingCeil(title: i.title, description: i.description)
                        .onTapGesture {
                            guard i.link == nil else {
                                print("setting view - go to \(i.link!)")
                                return
                            }
                        }
                }
            }
            .padding(.top, 72)
            Spacer()
            GADBannerViewController()
                .frame(width: GADAdSizeBanner.size.width, height: GADAdSizeBanner.size.height)
        }
        .addMbtiLogo()
        .addBackButton {
            dismiss()
        }
        .navigationBarBackButtonHidden()
        .background(Color.main100)
    }
}
