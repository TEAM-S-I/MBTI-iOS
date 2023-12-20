//
//  HomeView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/15/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var isLoading: Bool = true
    @State var selectedTab: TabViewType = .match
    
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    Color.main100
                        .ignoresSafeArea()
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
                    .addMbtiLogo()
                    .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .never))
                    VStack(spacing: 0) {
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
            if isLoading {
                LaunchScreenView().transition(.opacity).zIndex(1)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                withAnimation { isLoading = false }
            })
        }
    }
}
