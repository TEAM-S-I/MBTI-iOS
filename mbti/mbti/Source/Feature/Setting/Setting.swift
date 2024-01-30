//
//  Setting.swift
//  mbti
//
//  Created by dgsw8th71 on 1/30/24.
//

import Foundation

struct Setting: Hashable {
    let title: String
    let description: String
    let link: String?
    
    init(_ title: String,
         description: String = "",
         link: String? = nil
    ) {
        self.title = title
        self.description = description
        self.link = link
    }
}
