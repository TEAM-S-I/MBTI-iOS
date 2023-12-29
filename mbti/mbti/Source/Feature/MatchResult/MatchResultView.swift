//
//  ResultView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/15/23.
//

import SwiftUI

struct MatchResultView: View {
    
    @StateObject var viewModel = MatchResultViewModel()
    @State var opacity: Double = 0
    
    let data: [MbtiModel]
    let sliderValue: Int
    
    var body: some View {
        VStack(spacing: 0) {
            switch viewModel.sideEffect {
            case .Loading:
                LoadingView(title: "AI가 최적의 팀을\n만드는 중이에요")
            case .Success:
                CompleteView(title: "MBTI 팀 매칭이 완료되었습니다\n")
            case .Result:
                matchResult
            case .Fail:
                FailView(title: "MBTI 팀 매칭에 실패했습니다\n")
            }
        }
        .addMbtiLogo()
        .navigationBarBackButtonHidden()
        .background(Color.main100)
        .task {
            viewModel.getResult()
        }
        .onAppear {
            viewModel.data = data
            viewModel.sliderValue = sliderValue
        }
    }
    
    @ViewBuilder
    var matchResult: some View {
        ZStack {
            VStack(spacing: 0) {
                Text("매칭 결과")
                    .applyFontStyle(.title)
                    .padding(.top, 72)
                Text("광고를 보면 팀원들의 역할과 특징을 알 수 있어요!")
                    .applyFontStyle(.label)
                    .padding(.top, 12)
                    .padding(.bottom, 36)
                ScrollView {
                    VStack {
                        ForEach(viewModel.resultData, id: \.self) {
                            MatchResultTeamCeil(teamName: $0.team_name, members: $0.members.toModel())
                                .padding(.bottom, 48)
                        }
                    }
                }
                MbtiTransparentButton("홈으로") {
                    NavigationUtil.popToRootView()
                }
                .padding(.vertical, 12)
            }
            VStack {
                Spacer()
                Button {
                    print("show ad!")
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
        .opacity(opacity)
        .onAppear {
            withAnimation {
                opacity = 1
            }
        }
    }
}
