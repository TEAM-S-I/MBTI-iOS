//
//  MatchLog.swift
//  mbti
//
//  Created by dgsw8th71 on 12/30/23.
//

import SwiftUI
import RealmSwift
import GoogleMobileAds

struct MatchLogView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State var isLog = false
    @StateObject var viewModel = MatchLogViewModel()
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(viewModel.models, id: \.self) { i in
                        MatchLogCeil(model: i) {
                            viewModel.resultData = i.data.map { $0.toDto() }
                            viewModel.clickedModel = i
                            isLog = true
                        }
                    }
                }
            }
            .padding(.top, 144)
            NavigationLink(isActive: $isLog) {
                MatchLogDetailView(viewModel: viewModel)
            } label: {
                
            }
            GADBannerViewController()
                .frame(width: GADAdSizeBanner.size.width, height: GADAdSizeBanner.size.height)
        }
        .addMbtiLogo()
        .addBackButton {
            dismiss()
        }
        .background(Color.main100)
        .navigationBarBackButtonHidden()
        .onAppear {
        }
    }
}
