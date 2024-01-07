//
//  RewardViewModel.swift
//  mbti
//
//  Created by dgsw8th71 on 1/7/24.
//

import SwiftUI

class RewardViewModel: ObservableObject {
    
    @Published var reward: RewardedAd
    
    init() {
        reward = RewardedAd()
        reward.load()
    }
}
