//
//  HomeView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/15/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var selectedTab: TabViewType = .match
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                MatchView()
                    .tabItem {
                        MbtiLogoImage(type: .small)
                    }
                    .tag(TabViewType.match)
                FindView()
                    .tabItem {
                        MbtiLogoImage(type: .small)
                    }
                    .tag(TabViewType.find)
                CheckView()
                    .tabItem {
                        MbtiLogoImage(type: .small)
                    }
                    .tag(TabViewType.check)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            VStack {
                Spacer()
                HStack {
                    ForEach(TabViewType.allCases, id: \.self) { tab in
                        Button {
                            selectedTab = tab
                        } label: {
                            Text("\(tab.rawValue)")
                                .foregroundColor(selectedTab == tab ? .red : .blue)
                        }
                    }
                }
            }
        }
    }
}
