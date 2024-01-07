//
//  MatchFirst.swift
//  mbti
//
//  Created by dgsw8th71 on 12/19/23.
//

import SwiftUI

struct MatchFirst: View {
    
    @Environment(\.dismiss) private var dismiss
    @State var isAddActive = false
    @State var isFixActive = false
    @State var isWarnActive = false
    @State var name = ""
    @State var mbti: MbtiType? = nil
    @State var data: [MbtiDTO] = isDebug ? dummy : []
    
    @State var clickedDTO: MbtiDTO?
    @State var fixName = ""
    @State var fixMbti: MbtiType? = nil
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Text("매칭할 팀원을 추가해 주세요")
                        .applyFontStyle(.title)
                        .padding(.top, 100)
                    MbtiGrid(data: data) {
                        isAddActive = true
                    } fixCallback: { clickedDTO in
                        self.clickedDTO = clickedDTO
                        self.isFixActive = true
                    }
                    .padding(.top, 64)
                    Spacer()
                    NavigationLink {
                        MatchSecondView(data: $data)
                    } label: {
                        MbtiTransparentButton("다음 단계로") {
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
            if isFixActive {
                MbtiDialog(isActive: $isFixActive) {
                    Text("팀원 정보 수정")
                        .applyFontStyle(.subtitle)
                        .padding(.leading, 4)
                        .toLeading()
                    MbtiTextField("이름을 입력해 주세요", text: $fixName, type: .topRadius)
                        .padding(.top, 12)
                    MbtiDropDown(choicedElement: $fixMbti, type: .bottomRadius)
                    ZStack {
                        HStack {
                            Button {
                                self.data = data.filter {
                                    $0.id != clickedDTO?.id
                                }
                                isFixActive = false
                            } label: {
                                Text("삭제")
                                    .foregroundColor(.red)
                                    .applyFontStyle(.label)
                            }
                            Spacer()
                        }
                        MbtiTransparentButton("수정 완료", fontStyle: .body) {
                            guard fixName.isEmpty || fixMbti == nil else {
                                var oldData = Array(data)
                                for var (idx, i) in Array(oldData.enumerated()) {
                                    if i.id == clickedDTO?.id {
                                        var d = i
                                        d.name = fixName
                                        fixName = ""
                                        d.mbti = fixMbti!
                                        fixMbti = nil
                                        isFixActive = false
                                        oldData[idx] = d
                                        data = oldData
                                        print("changed to \(data) \(oldData)")
                                        return
                                    }
                                }
                                
                                return
                            }
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
