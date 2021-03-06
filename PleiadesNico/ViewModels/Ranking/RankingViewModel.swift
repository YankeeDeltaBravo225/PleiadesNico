//
//  RankingViewModel.swift
//  XML_Sample
//
//  Created by katot on 2021/04/03.
//

import Foundation
import Combine

final class RankingViewModel: ObservableObject {

    typealias Rank  = CommonData.VideoAttribute

    @Published var showLoading  : Bool    = false
    @Published var showSelector : Bool    = false
    @Published var genreId      : Int     = ConfigStorage.shared.rankingGenre
    @Published var termId       : Int     = ConfigStorage.shared.rankingTerm
    @Published var ranks        : [Rank]  = []
    @Published var abstractText : String  = ""

    private let rankingApi  : RankingAPI
    private let session     : NicoSession
    private var appearCount : Int
    private var isLoading   : Bool


    init(){
        self.rankingApi  = RankingAPI()
        self.session     = NicoSession()
        self.appearCount = 0
        self.isLoading   = false
    }


    func onAppearRanking(){
        if self.appearCount == 0 {
            loadRanking()
        }

        self.appearCount += 1
    }

    func loadRanking(){
        if self.isLoading {
            return
        }
        
        self.showLoading = true
        self.isLoading   = true
        self.ranks       = []

        let genreDescription = rankingApi.genreDescription(genreId: self.genreId)
        let termDescription  = rankingApi.termDescription(termId: self.termId)
        self.abstractText    = "\(genreDescription) / \(termDescription)"

        self.session.get(
            urlText    : rankingApi.url(genreId: self.genreId, termId: self.termId),
            onReceived : {text in
                self.onReceivedRankItems(text)
            },
            onError: { error in
                self.onError(error)
            }
        )
    }


    func onReceivedRankItems(_ xmlText : String){
        let rankItems = self.rankingApi.decodeXml(xmlText)

        self.ranks = rankItems.map{ item in
            CommonData.VideoAttribute(
                number        : item.pos,
                contentId     : item.videoId,
                title         : item.title,
                thumbnail     : item.thumbnail,
                uploaded      : item.uploaded.replacingOccurrences(of: "???", with: ":"),
                duration      : item.duration,
                views         : item.views,
                comments      : item.comments,
                mylists       : item.mylists
            )
        }
        
        self.isLoading   = false
        self.showLoading = false
    }

    
    func onError(_ error : String){
        DebugLog.shared.error(error)
        self.showLoading = false
    }


    func onSelectorEnabled(){
        self.showSelector = true
    }


    func genreOptions() -> [Int : String] {
        let options : [Int : String] = RankingAPI.genres
            .map{ [$0.id : $0.description] }
            .reduce([Int:String]()){ $0.merging($1, uniquingKeysWith: +) }

        return options
    }

    
    func updateGenre(_ newGenreId : Int ){
        self.genreId  = newGenreId
        ConfigStorage.shared.rankingGenre = newGenreId
        loadRanking()
    }
    
    func termOptions() -> [Int : String] {
        let options : [Int : String] = RankingAPI.terms
            .map{ [$0.id : $0.description] }
            .reduce([Int:String]()){ $0.merging($1, uniquingKeysWith: +) }

        return options
    }


    func updateTerm(_ newTermId : Int ){
        self.termId   = newTermId
        ConfigStorage.shared.rankingTerm = newTermId

        loadRanking()
    }

}
