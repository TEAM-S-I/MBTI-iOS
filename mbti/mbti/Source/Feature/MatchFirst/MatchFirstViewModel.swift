//
//  MatchFirstViewModel.swift
//  mbti
//
//  Created by dgsw8th71 on 12/26/23.
//

import Foundation

class MatchFirstViewModel : ObservableObject {
    @Published var data: [MbtiModel] = []
    
    func addMember(name: String, mbti: MbtiType) {
        data.append(MbtiModel(name: name, mbti: mbti))
    }
}
