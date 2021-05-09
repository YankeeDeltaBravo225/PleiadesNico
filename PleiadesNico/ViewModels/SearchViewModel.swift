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

    typealias SearchKind  = SearchAPI.Kind
    typealias SortKey     = SearchAPI.SortKey
    typealias ResultItem  = SearchAPI.Result.Item

    @Published var searchWord     : String       = ""
    @Published var seachKind      : SearchKind   = .tag
    @Published var resultItems    : [ResultItem] = []
    @Published var sortKeys       : [SortKey]    = SearchAPI.sortKeys
    @Published var keyId          : Int          = 0
    @Published var orderId        : Int          = 0
    @Published var sortText       : String       = ""
    @Published var showAdd        : Bool         = false
    @Published var showNoHit      : Bool         = false
    @Published var showSortSelect : Bool         = false

    private var isSearching   : Bool
    private var searchOffset  : Int
    private var appearCount   : Int
    private var searchApi     : SearchAPI
    private let session       : NicoSession

    init(_ keyword : String = ""){
        self.searchWord   = keyword

        self.isSearching  = false
        self.searchOffset = 0
        self.appearCount  = 0
        self.searchApi    = SearchAPI()
        self.session      = NicoSession()
    }


    func newSearch(){
        if self.isSearching {
            return
        }

        self.searchOffset = 0
        self.showNoHit    = false
        self.resultItems        = []

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
        self.showAdd     = false
        
        let searchUrl = searchApi.url(
            word        : self.searchWord,
            kind        : self.seachKind,
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

    func updateSort(newKeyId : Int, newOrderId : Int){
        self.keyId   = newKeyId
        self.orderId = newOrderId

        updateSortOrderDescription()
    }
    

    func onReceivedSearchResult(_ resultText : String ){
        let newItems = searchApi.decode(resultText)

        self.resultItems += newItems
        self.isSearching = false
        self.searchOffset += newItems.count
        if (newItems.count > 0) && (newItems.count == SearchAPI.unitNum)  {
            self.showAdd = true
        }
        if self.resultItems.count == 0 {
            self.showNoHit = true
        }
    }


    func onAppearSearch(){
        if self.appearCount == 0 && self.searchWord != "" {
            newSearch()
        }
        
        updateSortOrderDescription()
        self.appearCount += 1
    }

    
    func updateSortOrderDescription(){
        let sortKey = self.sortKeys[self.keyId]
        let keyDescription   = sortKey.description
        let orderDescription = sortKey.directions[orderId].description
        
        self.sortText = keyDescription + "(" + orderDescription + ")"
    }
    
}
