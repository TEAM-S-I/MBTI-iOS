//
//  ResultView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/15/23.
//

import SwiftUI

struct MatchResultView: View {
    
    @StateObject var viewModel = MatchResultViewModel()
    
    let data: [MbtiModel]
    let sliderValue: Int
    
    var body: some View {
        VStack(spacing: 0) {
            switch viewModel.sideEffect {
            case .Loading:
                LoadingView()
            case .Success:
                CompleteView()
            case .Result:
                matchResult
            case .Fail:
                LoadingView()
            }
        }
        .addMbtiLogo()
        .navigationBarBackButtonHidden()
        .background(Color.main100)
        .task {
            withAnimation {
                viewModel.getResult()
            }
        }
        .onAppear {
            viewModel.data = data
            viewModel.sliderValue = sliderValue
        }
    }
    
    @ViewBuilder
    var matchResult: some View {
        Text("매칭 결과")
            .applyFontStyle(.title)
            .padding(.top, 72)
        Text("광고를 보면 팀원들의 역할과 특징을 알 수 있어요!")
            .applyFontStyle(.label)
            .padding(.top, 12)
        ScrollView {
            VStack {
                ForEach(viewModel.resultData, id: \.self) {
                    MatchResultTeamCeil(teamName: $0.team_name, members: $0.members.toModel())
                        .padding(.top, 48)
                }
            }
        }
    }
}
