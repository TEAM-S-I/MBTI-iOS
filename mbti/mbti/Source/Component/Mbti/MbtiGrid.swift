//
//  MbtiGrid.swift
//  mbti
//
//  Created by dgsw8th71 on 12/22/23.
//

import SwiftUI

struct MbtiGrid: View {
    
    var columns: [GridItem] = Array(repeating: .init(.flexible(maximum: 67 + 8)), count: 3)
    
    var data: [MbtiModel]
    var addCallback: () -> Void
    
    init(data: [MbtiModel], addCallback: @escaping () -> Void) {
        self.data = data
        self.addCallback = addCallback
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(data, id: \.self) { model in
                    VStack {
                        NameCircle(model.name, type: model.mbti.nameCircleType)
                        Text(model.mbti.rawValue)
                            .applyFontStyle(.label)
                            .foregroundColor(.gray300)
                            .padding(.top, 8)
                    }
                }
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
            .padding(.horizontal)
        }
    }
}
