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
    
    var body: some View {
        let model = MbtiMatchModel.findAll()
        
        VStack {
            ScrollView {
                VStack {
                    ForEach(model, id: \.self) { i in
                        MatchLogCeil(model: i) {
                            isLog = true
                        }
                    }
                }
            }
            .padding(.top, 144)
            NavigationLink(isActive: $isLog) {
                
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
