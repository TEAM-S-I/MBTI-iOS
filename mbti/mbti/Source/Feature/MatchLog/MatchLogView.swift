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
    @ObservedResults(MatchLogModel.self) var teams
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(1..<30) { i in
                        
                    }
                }
            }
        }
        .addMbtiLogo()
        .addBackButton {
            dismiss()
        }
    }
}
