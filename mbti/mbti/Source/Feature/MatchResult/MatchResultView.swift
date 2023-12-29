//
//  ResultView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/15/23.
//

import SwiftUI

struct MatchResultView: View {
    
    @ObservedObject var viewModel = MatchResultViewModel()
    
    init(data: [MbtiModel], sliderValue: Int) {
        viewModel.data = data
        viewModel.sliderValue = sliderValue
    }
    
    var body: some View {
        VStack {
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
    }
    
    @ViewBuilder
    var matchResult: some View {
        Text("매칭 결과")
            .applyFontStyle(.title)
            .padding(.top, 72)
        Text("광고를 보면 팀원들의 역할과 특징을 알 수 있어요!")
            .padding(.top, 12)
        ScrollView {
            VStack {
//                    ForEach()
            }
        }
    }
}
