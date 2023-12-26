//
//  PacMemberResponseswift.swift
//  mbti
//
//  Created by dgsw8th71 on 12/26/23.
//

import Foundation

struct PacMemberResponse: Decodable {
    let name: String
    let mbti: String
    let strengths: String
    let weaknesses: String
}
