//
//  HomeView.swift
//  mbti
//
//  Created by dgsw8th71 on 12/15/23.
//

import SwiftUI
import RealmSwift

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
                                    HomeNavigationCeilView(image: tab.image, isSelected: selectedTab == tab)
                                        .padding(.horizontal, 46)
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
            
            
            // 1. config 설정(이전 버전에서 다음 버전으로 마이그레이션될때 어떻게 변경될것인지)
            let config = Realm.Configuration(
                schemaVersion: 3, // 새로운 스키마 버전 설정
                migrationBlock: { migration, oldSchemaVersion in
                    if oldSchemaVersion < 2 {
                        // 1-1. 마이그레이션 수행(버전 2보다 작은 경우 버전 2에 맞게 데이터베이스 수정)
                        migration.enumerateObjects(ofType: MatchLogDataModel.className()) { oldObject, newObject in
                            newObject!["name"] = ""
                        }
                    }
                }
            )
            
            // 2. Realm이 새로운 Object를 쓸 수 있도록 설정
            let _ = Realm.Configuration.defaultConfiguration = config
            
        }
    }
}
