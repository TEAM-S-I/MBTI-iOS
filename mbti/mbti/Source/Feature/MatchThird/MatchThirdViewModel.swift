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

class MatchThirdViewModel : ObservableObject {
    @Published var sideEffect: MatchResultSideEffect = .Loading
    @Published var resultData: [MbtiTeamDTO] = []
    @Published var loadingMsg = "AI가 최적의 팀을\n만드는 중이에요"
    @Published var successMsg = "MBTI 팀 매칭이 완료되었습니다\n"
    @Published var failMsg = "MBTI 팀 매칭에 실패했습니다\n"
    
    func getResult(data: [MbtiDTO], sliderValue: Int) {
        
        var lst: [String] = []
        for i in data {
            lst.append("\(i.name) : \(i.mbti)")
        }
        
        let prompt = lst.joined(separator: ", ")
        print("prompt - \(prompt)")
        AF.request("\(Secret.baseUrl)/make/team", method: .post, parameters: [
            "team":data.count,
            "teamCnt":sliderValue,
            "data": prompt
        ], encoding: JSONEncoding.default)
        .responseDecodable(of: BaseResponse<[CreateTeamResponse]>.self) { response in
                switch response.result {
                case .success(let res):
                    
                    self.resultData = res.data.map { $0.toDTO() }
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
        self.loadingMsg = "AI가 팀의 장단점을 분석하고 있어요..."
        self.successMsg = "팀의 장단점 분석이 완료되었습니다\n"
        self.failMsg = "장단점 분석에 실패했습니다"
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
