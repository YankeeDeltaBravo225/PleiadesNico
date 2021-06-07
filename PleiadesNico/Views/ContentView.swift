//
//  ContentView.swift
//  XML_Sample
//
//  Created by katot on 2021/03/28.
//

import SwiftUI
import Foundation

struct ContentView: View {

    enum Tab {
        case ranking
        case search
        case mylist
        case setting
    }
    
    @State private var selection: Tab = .ranking
    @State private var idMap : [Tab:UUID] = [
        .ranking : UUID(),
        .search  : UUID(),
        .mylist  : UUID()
    ]
    
    var body: some View {

        let selectable = Binding(
            get: {
                self.selection
            },
            set: {
                if self.selection == $0 {
                    self.idMap[ self.selection ] = UUID()
                }
                self.selection = $0
            }
        )
        
        TabView(selection: selectable) {
            RankingTopView()
                .tabItem {
                    Label("ランキング", systemImage: "rosette")
                }
                .tag(Tab.ranking)
                .id(self.idMap[Tab.ranking])

            SearchTopView()
                .tabItem {
                    Label("検索", systemImage: "magnifyingglass")
                }
                .tag(Tab.search)
                .id(self.idMap[Tab.search])
            
            MylistTopView()
                .tabItem {
                    Label("マイリスト", systemImage: "star")
                }
                .tag(Tab.mylist)
                .id(self.idMap[Tab.mylist])
            
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
