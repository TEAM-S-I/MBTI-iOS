//
//  MatchLogViewModel.swift
//  mbti
//
//  Created by dgsw8th71 on 12/31/23.
//

import Foundation
import Alamofire

class MatchLogViewModel: ObservableObject {
    
    @Published var loadingMsg = "AI가 팀의 장단점을 분석하고 있어요..."
    @Published var successMsg = "팀의 장단점 분석이 완료되었습니다\n"
    @Published var failMsg = "장단점 분석에 실패했습니다"
    @Published var matchLogList: [MbtiTeamModel] = []
    
    @Published var sideEffect: MatchResultSideEffect = .Result
    @Published var resultData: [MbtiTeamDTO] = []
    
    func getResult2() {
        
        var prompt: String = ""
        for i in resultData {
            prompt += i.name
            var m: [String] = []
            for j in i.members {
                m.append("\(j.name) : \(j.mbti)")
            }
            prompt += " (\(m.joined(separator: ", "))) "
        }
        
        print("prompt - \(prompt)")
        
        self.sideEffect = .Loading
        AF.request("\(Secret.baseUrl)/make/description", method: .post, parameters: [
            "data": prompt
        ], encoding: JSONEncoding.default)
        .responseDecodable(of: TeamResponse.self) { response in
                switch response.result {
                case .success(let res):
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.sideEffect = .Success
                    }
                    self.resultData = res.team.map { $0.toDTO() }
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
