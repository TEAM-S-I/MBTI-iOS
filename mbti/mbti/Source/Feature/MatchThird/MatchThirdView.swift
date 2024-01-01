//
//  ResultView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/15/23.
//

import SwiftUI

struct MatchThirdView: View {
    
    @StateObject var viewModel = MatchResultViewModel()
    @Binding var sliderValue: Double
    @Binding var data: [MbtiDTO]
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            switch viewModel.sideEffect {
            case .Loading:
                LoadingView(title: "AI가 최적의 팀을\n만드는 중이에요")
            case .Success:
                CompleteView(title: "MBTI 팀 매칭이 완료되었습니다\n")
            case .Result:
                MatchResultView(resultData: viewModel.resultData)
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
