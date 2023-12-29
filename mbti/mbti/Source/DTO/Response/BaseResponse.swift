//
//  BaseResponse.swift
//  mbti
//
//  Created by dgsw8th71 on 12/26/23.
//

struct BaseResponse<T: Decodable>: Decodable {
    let teams: T
}
