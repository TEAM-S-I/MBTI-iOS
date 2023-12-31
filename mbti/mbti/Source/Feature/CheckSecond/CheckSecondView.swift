//
//  CheckSecond.swift
//  mbti
//
//  Created by dgsw8th71 on 1/1/24.
//

import SwiftUI

struct CheckSecondView: View {
    
    @StateObject var viewModel = CheckSecondViewModel()
    @Binding var data: [MbtiDTO]
    
    var body: some View {
        VStack(spacing: 0) {
            switch viewModel.sideEffect {
            case .Loading:
                LoadingView(title: "AI가 최적의 팀을\n만드는 중이에요")
            case .Success:
                CompleteView(title: "MBTI 팀 매칭이 완료되었습니다\n")
            case .Result:
                FindResultView(title: "팀 진단 결과...")
            case .Fail:
                FailView(title: "MBTI 팀 매칭에 실패했습니다\n")
            }
        }
        .navigationBarBackButtonHidden()
        .background(Color.main100)
        .task {
            viewModel.getResult(data: data)
        }
    }
}
