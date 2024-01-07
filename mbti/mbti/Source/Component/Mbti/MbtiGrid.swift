//
//  MbtiGrid.swift
//  mbti
//
//  Created by dgsw8th71 on 12/22/23.
//

import SwiftUI

struct MbtiGrid: View {
    
    var columns: [GridItem] = Array(repeating: .init(.flexible(maximum: 67 + 8)), count: 3)
    
    var data: [MbtiDTO]
    var addCallback: () -> Void
    var fixCallback: (MbtiDTO) -> Void
    
    init(data: [MbtiDTO], 
         addCallback: @escaping () -> Void,
         fixCallback: @escaping (MbtiDTO) -> Void
    ) {
        self.data = data
        self.addCallback = addCallback
        self.fixCallback = fixCallback
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center) {
                ForEach(data, id: \.self) { model in
                    NormalNameCircle(model: model)
                        .onTapGesture {
                            fixCallback(model)
                        }
                }
                HStack {
                    VStack {
                        AddCircleButton {
                            addCallback()
                        }
                        Text("")
                            .applyFontStyle(.label)
                            .foregroundColor(.gray300)
                            .padding(.top, 8)
                    }
                }
            }
            .padding(.horizontal)
            Spacer()
        }
    }
}
