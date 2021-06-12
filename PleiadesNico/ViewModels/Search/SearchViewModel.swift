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

    typealias ResultItem    = CommonData.VideoAttribute

    @Published var searchWord      : String       = ""

    // @todo restore the latest value from ConfigStorage
    @Published var searchKindId     : Int         = ConfigStorage.shared.searchKind
    @Published var orderKeyId       : Int         = ConfigStorage.shared.searchOrderKey
    @Published var orderDirectionId : Int         = ConfigStorage.shared.searchOrderDirection

    @Published var resultItems     : [ResultItem] = []
    @Published var abstractText    : String       = ""
    @Published var directVideoId   : String       = ""
    @Published var showDirectOpen  : Bool         = false
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
            self.searchKindId = SearchAPI.Kind.tag.rawValue
        }
    }


    func newSearch(){
        self.searchOffset = 0
        self.showNoHit    = false
        self.showAdd      = false
        self.abstractText = ""
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

        if let videoId = TextFormat.shared.extractByRegex(
            text    : self.searchWord,
            pattern : "s[mo][0-9]+"
        ){
            self.directVideoId  = videoId
            self.showDirectOpen = true
        } else {
            self.showDirectOpen = false
        }

        let searchKind  : SearchAPI.Kind = (self.searchKindId == SearchAPI.Kind.tag.rawValue) ? .tag : .keyword
        let searchUrl = searchApi.url(
            word        : self.searchWord,
            kind        : searchKind,
            offset      : self.searchOffset,
            sortKeyId   : self.orderKeyId,
            sortOrderId : self.orderDirectionId
        )

        DebugLog.shared.debug("searchUrl : \(searchUrl)")

        self.session.get(
            urlText    : searchUrl,
            onReceived : {text in
                self.onReceivedSearchResult(text)
            },
            onError: { error in
                self.onError(error)
            }
        )
    }


    func sortKeyOptions()  -> [Int : String] {
        let options : [Int : String] = SearchAPI.sortKeys
            .map{ [$0.id : $0.description] }
            .reduce([Int:String]()){ $0.merging($1, uniquingKeysWith: +) }

        return options
    }
    
    
    func updateSortKey(newKeyId : Int){
        self.orderKeyId   = newKeyId
        ConfigStorage.shared.searchOrderKey = newKeyId

        newSearch()
    }


    func sortDirectionOptions()  -> [Int : String] {
        let options : [Int : String] = SearchAPI.sortKeys[ self.orderKeyId ].directions
            .map{ [$0.order.rawValue : $0.description] }
            .reduce([Int:String]()){ $0.merging($1, uniquingKeysWith: +) }

        return options
    }

    
    func updateSortDirection(newDirectionId : Int){
        self.orderDirectionId = newDirectionId
        ConfigStorage.shared.searchOrderDirection = newDirectionId

        newSearch()
    }


    func searchKindOptions()  -> [Int : String] {
        let options : [Int : String] = [
            SearchAPI.Kind.tag.rawValue     : "タグ",
            SearchAPI.Kind.keyword.rawValue : "キーワード",
        ]
        return options
    }


    func updateSearchKind(newKindId : Int){
        self.searchKindId = newKindId
        ConfigStorage.shared.searchKind = newKindId
        
        newSearch()
    }
    

    func onReceivedSearchResult(_ resultText : String ){
        let newResults = searchApi.decode(resultText)

        let newItems = newResults.indices.map{ index in
            CommonData.VideoAttribute(
                number        : index + self.resultItems.count,
                contentId     : newResults[index].contentId,
                title         : TextFormat.shared.htmlEntityDecoded( newResults[index].title ),
                thumbnail     : newResults[index].thumbnailUrl,
                uploaded      : TextFormat.shared.dateFromISO8601(newResults[index].startTime),
                duration      : TextFormat.shared.duration(newResults[index].lengthSeconds),
                views         : String(newResults[index].viewCounter),
                comments      : String(newResults[index].commentCounter),
                mylists       : String(newResults[index].mylistCounter)
            )
        }

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

    
    func onError(_ error : String){
        DebugLog.shared.error(error)
        self.showLoading = false
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

        let searchKindDescription = searchKindOptions()[ self.searchKindId ] ?? "?"
        self.abstractText = "\(searchKindDescription)検索 / \(self.searchWord)"
    }
    
}
