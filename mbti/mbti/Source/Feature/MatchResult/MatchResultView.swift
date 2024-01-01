//
//  MatchResultView.swift
//  mbti
//
//  Created by dgsw8th71 on 1/1/24.
//

import SwiftUI
import GoogleMobileAds

struct MatchResultView: View {
    
    let resultData: [MbtiTeamDTO]
    var rewardAd: RewardedAd
    
    @State var isActive: Bool = false
    @State var text: String = ""
    @State var opacity: Double = 0
    
    init(resultData: [MbtiTeamDTO]) {
        self.resultData = resultData
        self.rewardAd = RewardedAd()
        self.rewardAd.load()
    }
    
    var body: some View {
        let isAds = resultData[0].members[0].description == nil
        ZStack {
            VStack(spacing: 0) {
                Text("매칭 결과")
                    .applyFontStyle(.title)
                    .padding(.top, 72)
                if isAds {
                    Text("광고를 보면 팀원들의 역할과 특징을 알 수 있어요!")
                        .applyFontStyle(.label)
                        .padding(.top, 12)
                        .padding(.bottom, 36)
                }
                ScrollView {
                    VStack {
                        ForEach(resultData, id: \.self) {
                            MatchResultTeamCeil(teamName: $0.name, members: $0.members)
                            .padding(.bottom, 48)
                        }
                    }
                }
                MbtiTransparentButton("홈으로") {
                    isActive = true
                }
                .padding(.vertical, 12)
            }
            
            if isAds {
                VStack {
                    Spacer()
                    Button {
                        showAds()
                    } label: {
                        HStack {
                            Text("광고를 보고 더 많은 정보를 확인해 보세요!")
                                .applyFontStyle(.label)
                                .padding(.leading, 16)
                            Spacer()
                            Image("Video")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("시청")
                                .foregroundColor(.main800)
                                .font(Font.custom(GangwonEduAllFontFamily.bold.rawValue, size: 12))
                                .padding(.trailing, 16)
                        }
                        .frame(height: 46)
                        .background(Color.main100)
                        .cornerRadius(8)
                        .padding(.horizontal, 36)
                        .shadow1()
                    }
                    Spacer()
                        .frame(height: 60)
                }
            }
            if isActive {
                MbtiDialog(isActive: $isActive) {
                    Text("팀 매칭 기록을 저장하시겠습니까?")
                        .applyFontStyle(.subtitle)
                    MbtiTextField("매칭 제목", text: $text)
                        .padding(.top, 24)
                    HStack(spacing: 0) {
                        Spacer()
                        MbtiTransparentButton("아니요") {
                            isActive = false
                            NavigationUtil.popToRootView()
                        }
                        MbtiTransparentButton("저장") {
                            isActive = false
                            NavigationUtil.popToRootView()
                            // TODO: SAVE
                            let model = MbtiMatchModel()
                            
                            model.name = text.isEmpty ? "이름 없는 매칭" : text
                            model.data.append(objectsIn: resultData.map {
                                $0.toModel()
                            })
                            
                            MbtiMatchModel.addMatchLog(model)
                        }
                        .padding(.leading, 24)
                    }
                    .padding(.top, 36)
                }
            }
        }
        .addMbtiLogo()
        .opacity(opacity)
        .onAppear {
            withAnimation {
                opacity = 1
            }
        }
    }
    
    func showAds() {
        let result = self.rewardAd.showAd {
            
        }
        print("result - \(result)")
    }
}
