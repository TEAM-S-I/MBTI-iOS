//
//  MatchLogDetialView.swift
//  mbti
//
//  Created by dgsw8th71 on 1/7/24.
//

import SwiftUI

struct MatchLogDetailView: View {
    
    @State var viewModel: MatchLogViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            switch viewModel.sideEffect {
            case .Loading:
                LoadingView(title: viewModel.loadingMsg)
            case .Success:
                CompleteView(title: viewModel.successMsg)
            case .Result:
                MatchLogResultView(resultData: viewModel.resultData) {
                    viewModel.getResult2()
                }
            case .Fail:
                FailView(title: "MBTI 팀 매칭에 실패했습니다\n")
            }
        }
        .navigationBarBackButtonHidden()
        .background(Color.main100)
    }
}
