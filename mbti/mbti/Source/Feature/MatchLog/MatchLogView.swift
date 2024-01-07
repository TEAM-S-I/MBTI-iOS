//
//  MatchLog.swift
//  mbti
//
//  Created by dgsw8th71 on 12/30/23.
//

import SwiftUI
import RealmSwift

struct MatchLogView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State var isLog = false
    @StateObject var viewModel = MatchLogViewModel()
    
    var body: some View {
        let model = MbtiMatchModel.findAll()
        VStack {
            ScrollView {
                VStack {
                    ForEach(model, id: \.self) { i in
                        MatchLogCeil(model: i) {
                            viewModel.resultData = i.data.map { $0.toDto() }
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
