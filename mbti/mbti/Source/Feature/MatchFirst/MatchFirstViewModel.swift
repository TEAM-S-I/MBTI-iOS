//
//  MatchFirstViewModel.swift
//  mbti
//
//  Created by dgsw8th71 on 12/26/23.
//

import Foundation

class MatchFirstViewModel : ObservableObject {
    @Published var data: [MbtiModel] = []
    @Published var name = ""
    @Published var mbti: MbtiType? = nil
    
    func initState() {
        name = ""
        mbti = nil
    }
    
    func addMember(c: () -> Void) {
        if mbti != nil {
            data.append(MbtiModel(name: name, mbti: mbti!))
        } else {
            c()
        }
    }
}
