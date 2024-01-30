//
//  SettingView.swift
//  mbti
//
//  Created by dgsw8th71 on 1/30/24.
//

import SwiftUI

fileprivate let settings = [
    Setting("개인정보 약관", link: ""),
    Setting("서비스 이용정책", link: ""),
    Setting("버전", description: "v1.0")
]

struct SettingView: View {
    
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
            .padding(.top, 64)
            Spacer()
        }
        .addMbtiLogo()
        .addBackButton {
            dismiss()
        }
        .navigationBarBackButtonHidden()
        .background(Color.main100)
    }
}
