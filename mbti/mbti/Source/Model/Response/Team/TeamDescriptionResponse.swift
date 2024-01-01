//
//  TeamDescriptionResponse.swift
//  mbti
//
//  Created by dgsw8th71 on 12/26/23.
//

import Foundation

struct TeamDescriptionResponse: Decodable {
    let name: String
    let members: [TeamMemberResponse]
}
