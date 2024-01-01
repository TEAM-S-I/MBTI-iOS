//
//  CheckSecondViewModel.swift
//  mbti
//
//  Created by dgsw8th71 on 1/1/24.
//

import SwiftUI
import Alamofire

enum CheckResultSideEffect {
    case Loading
    case Success
    case Fail
    case Result
}

class CheckSecondViewModel: ObservableObject {
    
    @Published var sideEffect: MatchResultSideEffect = .Loading
    @Published var resultData = PacResponse(team: PacTeamResponse(members: []))
    
    func getResult(data: [MbtiDTO]) {
        
        var lst: [String] = []
        for i in data {
            lst.append("\(i.name)(\(i.mbti))")
        }
        
        let prompt = lst.joined(separator: ", ")
        print("prompt - \(prompt)")
        AF.request("\(Secret.baseUrl)/make/pac", method: .post, parameters: [
            "data": prompt
        ], encoding: JSONEncoding.default)
        .responseDecodable(of: PacResponse.self) { response in
                switch response.result {
                case .success(let res):
                    self.resultData = res
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
