//
//  ContentView.swift
//  XML_Sample
//
//  Created by katot on 2021/03/28.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    @State private var selection: Tab = .ranking
    
    enum Tab {
        case ranking
        case search
        case mylist
        case setting
    }
    
    var body: some View {
        
        TabView(selection: $selection) {
            RankingTopView()
                .tabItem {
                    Label("ランキング", systemImage: "rosette")
                }
                .tag(Tab.ranking)

            SearchTopView()
                .tabItem {
                    Label("検索", systemImage: "magnifyingglass")
                }
                .tag(Tab.search)

            MylistTopView()
                .tabItem {
                    Label("マイリスト", systemImage: "star")
                }
                .tag(Tab.mylist)
            
            SettingTopView()
                .tabItem {
                    Label("設定", systemImage: "gear")
                }
                .tag(Tab.setting)
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
