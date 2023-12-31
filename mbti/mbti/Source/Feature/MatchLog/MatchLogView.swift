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
    
    var body: some View {
        let model = MatchLogDataModel.findAll()
        VStack {
            ScrollView {
                VStack {
                    ForEach(model, id: \.self) { i in
                        MatchLogCeil(model: i) {
                            
                        }
                    }
                }
            }
            .padding(.top, 144)
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
