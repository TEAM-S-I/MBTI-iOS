//
//  PlanResponse.swift
//  mbti
//
//  Created by dgsw8th71 on 12/26/23.
//

import Foundation

struct PlanResponse: Decodable {
    let team: PlanTeamResponse
    let plan: String
}
