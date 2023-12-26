//
//  MatchSecondViewModel.swift
//  mbti
//
//  Created by dgsw8th71 on 12/26/23.
//

import Foundation
import Alamofire

class MatchSecondViewModel : ObservableObject {
    @Published var data: [MbtiModel] = []
    
    func getResult(s: Int) {
        
        var lst: [String] = []
        for i in data {
            lst.append("\(i.name) : \(i.mbti)")
        }
        
        let prompt = lst.joined(separator: ", ")
        
        
        AF.request("\(Secret.baseUrl)/make/team", method: .post, parameters: [
            "data": "총 \(s)팀 팀원수 \(data.count)명 " + prompt
        ])
            .responseDecodable(of: BaseResponse<CreateTeamResponse>.self) { response in
                print(response)
            }
    }
}
