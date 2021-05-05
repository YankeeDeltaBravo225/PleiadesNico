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

    @Published var items       : [SearchAPI.Result.Item]
    @Published var searchWord  : String
    @Published var kind        : SearchAPI.Kind
    @Published var showAdd     : Bool
    @Published var showNoHit   : Bool
    
    private var isSearching   : Bool
    private var searchOffset  : Int
    private var appearCount   : Int
    private var searchApi     : SearchAPI
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
        self.searchApi    = SearchAPI()
        self.session      = NicoSession()
    }


    func newSearch(){
        if self.isSearching {
            return
        }

        self.showNoHit = false
        self.items     = []
        startSearch()
    }


    func contSearch(){
        if self.isSearching {
            return
        }

        startSearch()
    }
    
    
    func startSearch(){
        self.isSearching = true
        self.showAdd = false
        
        session.get(
            urlText    : searchApi.url(word: searchWord, kind: kind, offset: searchOffset),
            onReceived : {text in
                self.onReceivedSearchResult(text)
            },
            onError: { error in
                print(error)
            }
        )
    }


    func onReceivedSearchResult(_ resultText : String ){
        let newItems = searchApi.decode(resultText)

        self.items += newItems
        self.isSearching = false
        self.searchOffset += newItems.count
        if (newItems.count > 0) && (newItems.count == SearchAPI.unitNum)  {
            self.showAdd = true
        }
        if self.items.count == 0 {
            self.showNoHit = true
        }
    }


    func onAppearSearch(){
        if self.appearCount == 0 && self.searchWord != "" {
            newSearch()
        }
        
        self.appearCount += 1
    }

}
