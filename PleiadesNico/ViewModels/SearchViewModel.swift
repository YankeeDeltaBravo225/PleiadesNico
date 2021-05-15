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

    typealias SearchKind    = SearchAPI.Kind
    typealias SortKey       = SearchAPI.SortKey
    typealias SortDirection = SearchAPI.SortDirection
    typealias ResultItem    = SearchAPI.Result.Item

    @Published var searchWord      : String       = ""
    @Published var searchKind      : SearchKind   = .tag
    @Published var searchKindId    : Int          = SearchKind.tag.rawValue
    @Published var searchKindTexts : [String]     = [ "タグ", "キーワード" ]
    @Published var resultItems     : [ResultItem] = []
    @Published var sortKeys        : [SortKey]    = SearchAPI.sortKeys
    @Published var keyId           : Int          = 0
    @Published var orderId         : Int          = 0
    @Published var abstractText    : String       = ""
    @Published var showLoading     : Bool         = false
    @Published var showAdd         : Bool         = false
    @Published var showNoHit       : Bool         = false
    @Published var showSortSelect  : Bool         = false

    private var isSearching   : Bool
    private var searchOffset  : Int
    private var appearCount   : Int
    private var searchApi     : SearchAPI
    private let session       : NicoSession
    private let isImmediate   : Bool


    init(_ word : String = "", isImmediate : Bool ){
        self.searchWord   = word

        self.isSearching  = false
        self.searchOffset = 0
        self.appearCount  = 0
        self.searchApi    = SearchAPI()
        self.session      = NicoSession()
        self.isImmediate  = isImmediate
        
        if isImmediate {
            self.searchKind = .tag
        }
    }


    func newSearch(){
        self.searchOffset = 0
        self.showNoHit    = false
        self.resultItems  = []

        search()
    }


    func contSearch(){
        search()
    }


    func search(){
        if self.isSearching {
            return
        }

        if self.searchWord == ""{
            return
        }
        
        updateAbstract()
        
        self.isSearching = true
        self.showLoading = true
        self.showAdd     = false
        
        let searchUrl = searchApi.url(
            word        : self.searchWord,
            kind        : self.searchKind,
            offset      : self.searchOffset,
            sortKeyId   : self.keyId,
            sortOrderId : self.orderId
        )

        DebugLog.shared.debug("searchUrl : \(searchUrl)")

        self.session.get(
            urlText    : searchUrl,
            onReceived : {text in
                self.onReceivedSearchResult(text)
            },
            onError: { error in
                print(error)
            }
        )
    }


    func sortOrders() -> [SortDirection] {
        return self.sortKeys[ self.keyId ].directions
    }
    
    
    func updateSortKey(newKeyId : Int){
        self.keyId   = newKeyId

        newSearch()
    }


    func updateSortOrder(newOrderId : Int){
        self.orderId = newOrderId

        newSearch()
    }

    func updateSearchKind(newKindId : Int){
        self.searchKindId = newKindId
        self.searchKind   = (newKindId == SearchKind.tag.rawValue) ? .tag : .keyword
    
        newSearch()
    }
    

    func onReceivedSearchResult(_ resultText : String ){
        let newItems = searchApi.decode(resultText)

        self.resultItems += newItems
        self.isSearching = false
        self.showLoading = false
        
        self.searchOffset += newItems.count
        if (newItems.count > 0) && (newItems.count == SearchAPI.unitNum)  {
            self.showAdd = true
        }
        if self.resultItems.count == 0 {
            self.showNoHit = true
        }
    }


    func onAppearSearch(){
        if self.appearCount == 0 {
            if self.isImmediate {
                newSearch()
            }
        }

        self.appearCount += 1
    }

    
    func updateAbstract(){
//        let sortKey = self.sortKeys[self.keyId]
//        let keyDescription   = sortKey.description
//        let orderDescription = sortKey.directions[orderId].description
        
        let searchKindDescription = self.searchKindTexts[ self.searchKindId ]
        
        self.abstractText = "\(searchKindDescription)検索 / \(self.searchWord)"
    }
    
}
