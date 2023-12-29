//
//  MbtiModel.swift
//  mbti
//
//  Created by dgsw8th71 on 12/21/23.
//

import Foundation


struct MbtiModel: Hashable, Identifiable {
    var id = UUID()
    let name: String
    let mbti: MbtiType
}
