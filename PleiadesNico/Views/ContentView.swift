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
    }
    
    var body: some View {
        
        TabView(selection: $selection) {
            RankingTopView()
                .tabItem {
                    Label("ランキング", systemImage: "rosette")
                }
                .tag(Tab.ranking)

            SearchView()
                .tabItem {
                    Label("検索", systemImage: "magnifyingglass")
                }
                .tag(Tab.search)
        }
        
        
//        PlayerTopView("sm38564936")
//        PlayerTopView("sm1192")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
