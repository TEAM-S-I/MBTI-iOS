//
//  FindResultView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/20/23.
//

import SwiftUI

struct FindResultView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let data = Array(repeating: 1, count: 10)
    let title: String
    
    @State var selectedTab = 0
    
    // MARK: - Find
    let findData: PacDTO?
    
    // MARK: - Check
    let checkData: PacDTO?
    
    init(title: String,
         findData: PacDTO? = nil,
         checkData: PacDTO? = nil
    ) {
        self.title = title
        self.findData = findData
        self.checkData = checkData
    }
    
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text(title)
                    .applyFontStyle(.body)
                    .padding(.top, geo.size.height / 8)
                
                // MARK: - find
                if findData != nil {
                    TabView(selection: $selectedTab) {
                        ForEach(Array(findData!.team.members.enumerated()), id: \.element) { idx, i in
                            let _ = print(i.mbti)
                            FindResultCeil(title: i.name, subTitle: i.mbti, strengths: i.strengths, weaknesses: i.weaknesses, mbti: MbtiType.getType(i.name) ?? .entp)
                                .padding(.horizontal, 12)
                                .tag(idx)
                        }
                    }
                    .frame(height: 420)
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .shadow1()
                    
                    HStack(spacing: 6) {
                        ForEach(0..<findData!.team.members.count) { i in
                            Circle()
                                .fill(i == selectedTab ? Color.main800 : Color.main300)
                                .frame(width: 6, height: 6)
                        }
                    }
                    .padding(.top, 28)
                }
                // MARK: - find
                
                // MARK: - check
                if checkData != nil {
                    TabView(selection: $selectedTab) {
                        ForEach(Array(checkData!.team.members.enumerated()), id: \.element) { idx, i in
                            FindResultCeil(title: i.mbti, subTitle: i.name, strengths: i.strengths, weaknesses: i.weaknesses, mbti: MbtiType.getType(i.mbti) ?? .infj)
                                .padding(.horizontal, 12)
                                .tag(idx)
                        }
                    }
                    .frame(height: 420)
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .shadow1()
                    
                    HStack(spacing: 6) {
                        ForEach(0..<checkData!.team.members.count) { i in
                            Circle()
                                .fill(i == selectedTab ? Color.main800 : Color.main300)
                                .frame(width: 6, height: 6)
                        }
                    }
                    .padding(.top, 28)
                }
                // MARK: - check
                
                Spacer()
                MbtiTransparentButton("홈으로") {
                    NavigationUtil.popToRootView()
                }
                .padding(.vertical, 12)
            }
        }
        .addMbtiLogo()
        .addBackButton {
            dismiss()
        }
        .navigationBarBackButtonHidden()
        .background(Color.main100)
    }
}
