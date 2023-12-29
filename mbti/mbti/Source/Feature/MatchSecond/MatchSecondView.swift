//
//  MatchSecondView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/20/23.
//

import SwiftUI

struct MatchSecondView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State var sliderValue = 1.0
    @ObservedObject var viewModel = MatchSecondViewModel()
    
    init(data: [MbtiModel]) {
        viewModel.data = data
    }
    
    var body: some View {
        let count = viewModel.data.count
        GeometryReader { geo in
            HStack {
                Spacer()
                VStack {
                    Text("총 \(count)명이시네요!\n마지막으로 팀 당 인원을 정해주세요")
                        .applyFontStyle(.title)
                        .padding(.top, geo.size.height / 5)
                    Text("\(Int(sliderValue))명")
                        .applyFontStyle(.subtitle)
                        .padding(.top, geo.size.height / 6)
                    HStack {
                        Text("1")
                            .applyFontStyle(.body)
                        Slider(value: $sliderValue, in: 1...2, step: 1)
                            .tint(.main800)
                            .accentColor(.main300)
                        Text("\(count)")
                            .applyFontStyle(.body)
                    }
                    .padding(.top, 8)
                    .padding(.horizontal, 24)
                    Text("\(Int(ceil(Double(count)/sliderValue)))팀으로 나눠져요")
                        .foregroundColor(.main300)
                        .applyFontStyle(.body)
                    Spacer()
                    NavigationLink {
                        MatchResultView(data: viewModel.data, sliderValue: Int(sliderValue))
                    } label: {
                        MbtiTransparentButton("매칭 시작!") {
                            
                        }
                        .disabled(true)
                    }
                    .padding(.vertical, 12)
                }
                Spacer()
            }
            .addMbtiLogo()
            .addBackButton {
                dismiss()
            }
            .navigationBarBackButtonHidden()
            .background(Color.main100)
        }
    }
}

       
