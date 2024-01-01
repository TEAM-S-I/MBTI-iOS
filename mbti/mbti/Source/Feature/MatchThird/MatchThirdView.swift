//
//  ResultView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/15/23.
//

import SwiftUI

struct MatchThirdView: View {
    
    @StateObject var viewModel = MatchThirdViewModel()
    @Binding var sliderValue: Double
    @Binding var data: [MbtiDTO]
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            switch viewModel.sideEffect {
            case .Loading:
                LoadingView(title: viewModel.loadingMsg)
            case .Success:
                CompleteView(title: viewModel.successMsg)
            case .Result:
                MatchResultView(resultData: viewModel.resultData) {
                    viewModel.getResult2()
                }
            case .Fail:
                FailView(title: "MBTI 팀 매칭에 실패했습니다\n")
            }
        }
        .navigationBarBackButtonHidden()
        .background(Color.main100)
        .task {
            if !isLoading {
                viewModel.getResult(data: data, sliderValue: Int(sliderValue))
                isLoading = true
            }
        }
    }
}
