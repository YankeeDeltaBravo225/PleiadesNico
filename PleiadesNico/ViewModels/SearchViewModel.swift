//
//  SearchViewModel.swift
//  XML_Sample
//
//  Created by katot on 2021/04/10.
//

import Foundation

import Foundation
import Combine

final class SearchViewModel: ObservableObject {

    @Published var items       : [NicoSearch.Result.Item]
    @Published var searchWord  : String
    @Published var kind        : NicoSearch.Kind
    @Published var showAdd     : Bool
    @Published var showNoHit   : Bool
    
    private var isSearching   : Bool
    private var searchOffset  : Int
    private var appearCount   : Int
    private let session       : NicoSession

    init(_ keyword : String = ""){
        self.showAdd      = false
        self.showNoHit    = false
        self.searchOffset = 0
        self.appearCount  = 0
        self.isSearching  = false
        self.searchWord   = keyword
        self.items        = []
        self.kind         = .tag
        self.session      = NicoSession()
    }


    func newSearch(){
        if self.isSearching {
            return
        }

        self.showNoHit = false
        self.items     = []
        search()
    }


    func contSearch(){
        if self.isSearching {
            return
        }

        search()
    }
    
    
    func search(){
        self.isSearching = true
        self.showAdd = false
        
        session.get(
            urlText    : NicoSearch.url(word: searchWord, kind: kind, offset: searchOffset),
            onReceived : {text in
                let data     = text.data(using: .utf8)
                let decorder = JSONDecoder()
                guard let decodeResp = try? decorder.decode(NicoSearch.Result.self, from: data!) else {
                    DebugLog.shared.error("Json decode エラー")
                    return
                }
                
                let newItems = decodeResp.data
                
                
                self.items += newItems
                self.isSearching = false
                self.searchOffset += newItems.count
                if (newItems.count > 0) && (newItems.count == NicoSearch.unitNum)  {
                    self.showAdd = true
                }
                if self.items.count == 0 {
                    self.showNoHit = true
                }
            }
        )
    }
    

    func onAppearSearch(){
        if self.appearCount == 0 && self.searchWord != "" {
            newSearch()
        }
        
        self.appearCount += 1
    }

}
