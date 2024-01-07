//
//  CheckFirstView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/22/23.
//

import SwiftUI

let isDebug = true
let dummy = [
    MbtiDTO(name: "Hello", mbti: .enfj),
    MbtiDTO(name: "제임스", mbti: .infj),
    MbtiDTO(name: "호날두", mbti: .estp),
]

struct CheckFirstView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State var isAddActive = false
    @State var isWarnActive = false
    @State var name = ""
    @State var mbti: MbtiType? = nil
    @State var data: [MbtiDTO] = isDebug ? dummy : []
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Text("진단할 팀원을 추가해 주세요")
                        .applyFontStyle(.title)
                        .padding(.top, 100)
                    MbtiGrid(data: data) {
                        isAddActive = true
                    } fixCallback: { dto in
                        
                    }
                    .padding(.top, 64)
                    Spacer()
                    NavigationLink {
                        CheckSecondView(data: $data)
                    } label: {
                        MbtiTransparentButton("진단시작!") {
                            isWarnActive = true
                        }
                        .disabled(data.count >= 2)
                    }
                    .padding(.vertical, 12)
                }
                Spacer()
            }
            .addMbtiLogo()
            .addBackButton {
                dismiss()
            }
            .navigationBarBackButtonHidden()
            .background(Color.main100)
            if isAddActive {
                MbtiDialog(isActive: $isAddActive) {
                    Text("팀원 정보 입력")
                        .applyFontStyle(.subtitle)
                        .padding(.leading, 4)
                        .toLeading()
                    MbtiTextField("이름을 입력해 주세요", text: $name, type: .topRadius)
                        .padding(.top, 12)
                    MbtiDropDown(choicedElement: $mbti, type: .bottomRadius)
                    MbtiTransparentButton("추가 완료", fontStyle: .body) {
                        guard name.isEmpty || mbti == nil else {
                            data.append(MbtiDTO(name: name, mbti: mbti ?? .enfj))
                            name = ""
                            mbti = nil
                            isAddActive = false
                            return
                        }
                    }
                    .padding(.top, 16)
                    .padding(.bottom, 4)
                }
            }
            if isWarnActive {
                MbtiDialog(isActive: $isWarnActive, isCloseButton: false) {
                    Text("팀원을 두 명 이상 추가해 주세요!")
                        .applyFontStyle(.subtitle)
                        .padding(.leading, 4)
                        .toLeading()
                    
                    MbtiTransparentButton("닫기", fontStyle: .body) {
                        isWarnActive = false
                    }
                    .padding(.top, 36)
                }
            }
        }
    }
}
