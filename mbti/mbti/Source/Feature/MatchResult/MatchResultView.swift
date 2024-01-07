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
    @EnvironmentObject var rewardVM: RewardViewModel
    let callback: () -> Void
    
    @State var isSaveDialog: Bool = false
    @State var isDetailDialog: Bool = false
    @State var text: String = ""
    @State var opacity: Double = 0
    @State var clickedDTO: MbtiDTO?
    
    init(resultData: [MbtiTeamDTO],
         callback: @escaping () -> Void
    ) {
        self.resultData = resultData
        self.callback = callback
    }
    
    var body: some View {
        let isAds = resultData[0].members[0].description == nil
        ZStack {
            VStack(spacing: 0) {
                Text("매칭 결과")
                    .applyFontStyle(.title)
                    .padding(.top, 72)
                Text(isAds ? "광고를 보면 팀원들의 역할과 특징을 알 수 있어요!" : "이제 팀원을 클릭하여 역할과 특징을 확인해 보세요!")
                    .applyFontStyle(.label)
                    .padding(.top, 12)
                    .padding(.bottom, 36)
                ScrollView {
                    VStack {
                        ForEach(resultData, id: \.self) {
                            MatchResultTeamCeil(teamName: $0.name, members: $0.members) { i in
                                clickedDTO = i
                                isDetailDialog = true
                                print(i)
                            }
                            .padding(.bottom, 48)
                        }
                    }
                }
                MbtiTransparentButton("홈으로") {
                    isSaveDialog = true
                }
                .padding(.vertical, 12)
            }
            .addMbtiLogo()
            
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
            if isSaveDialog {
                MbtiDialog(isActive: $isSaveDialog) {
                    Text("팀 매칭 기록을 저장하시겠습니까?")
                        .applyFontStyle(.subtitle)
                    MbtiTextField("매칭 제목", text: $text)
                        .padding(.top, 24)
                    HStack(spacing: 0) {
                        Spacer()
                        MbtiTransparentButton("아니요") {
                            isSaveDialog = false
                            NavigationUtil.popToRootView()
                        }
                        MbtiTransparentButton("저장") {
                            isSaveDialog = false
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
            if isDetailDialog {
                MbtiDialog(isActive: $isDetailDialog) {
                    if isAds {
                        Text("광고를 보면 팀원들의\n역할과 특징을 알 수 있어요")
                            .applyFontStyle(.subtitle)
                            .padding()
                    } else if clickedDTO != nil && clickedDTO?.role != nil {
                        VStack {
                            Text("\(clickedDTO!.name)(\(clickedDTO!.mbti.rawValue))님은...")
                                .applyFontStyle(.body)
                                .toLeading()
                            Text("'\(clickedDTO!.role!)'역할이 적합해요!")
                                .applyFontStyle(.subtitle)
                                .padding(.top, 4)
                                .toLeading()
                            Text(clickedDTO!.description!.insertNewline(30))
                                .foregroundColor(.main300)
                                .applyFontStyle(.body)
                                .padding(.top, 16)
                        }
                        .padding(5)
                        
                        MbtiTransparentButton("닫기") {
                            isDetailDialog = false
                        }
                        .toTrailing()
                        .padding(.top, 36)
                        
                    }
                }
            }
        }
        .opacity(opacity)
        .onAppear {
            withAnimation {
                opacity = 1
            }
        }
    }
    
    func showAds() {
        let result = rewardVM.reward.showAd {
            print("callback - matchreusltview")
            callback()
        }
        print("result - \(result)")
    }
}
