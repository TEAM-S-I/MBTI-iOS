//
//  MatchResultViewModel.swift
//  mbti
//
//  Created by dgsw8th71 on 12/29/23.
//

import Foundation
import Alamofire

enum MatchResultSideEffect {
    case Loading
    case Success
    case Fail
    case Result
}

class MatchResultViewModel : ObservableObject {
    @Published var data: [MbtiModel] = []
    @Published var sliderValue: Int = 0
    @Published var sideEffect: MatchResultSideEffect = .Loading
    @Published var resultData: [CreateTeamResponse] = []
    
    func getResult() {
        
        var lst: [String] = []
        for i in data {
            lst.append("\(i.name) : \(i.mbti)")
        }
        
        let prompt = lst.joined(separator: ", ")
        
        AF.request("\(Secret.baseUrl)/make/team", method: .post, parameters: [
            "data": "총 \(sliderValue)팀 팀원수 \(data.count)명 " + prompt
        ], encoding: JSONEncoding.default)
        .responseDecodable(of: BaseResponse<[CreateTeamResponse]>.self) { response in
                switch response.result {
                case .success(let res):
                    self.resultData = res.teams
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.sideEffect = .Success
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3 + 2) {
                        self.sideEffect = .Result
                    }
                    break
                case .failure(let e):
                    self.sideEffect = .Fail
                    print(e)
                    break
                }
            }
    }
    
    func completeSuccess() {
        sideEffect = .Result
    }
    
    
}
