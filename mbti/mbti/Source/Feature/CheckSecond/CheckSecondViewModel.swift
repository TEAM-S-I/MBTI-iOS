//
//  CheckSecondViewModel.swift
//  mbti
//
//  Created by dgsw8th71 on 1/1/24.
//

import SwiftUI

enum CheckResultSideEffect {
    case Loading
    case Success
    case Fail
    case Result
}

class CheckSecondViewModel: ObservableObject {
    
    @Published var sideEffect: MatchResultSideEffect = .Loading
    @Published var resultData: [CreateTeamResponse] = []
    
    func getResult(data: [MbtiDTO]) {
        
    }
    
}
