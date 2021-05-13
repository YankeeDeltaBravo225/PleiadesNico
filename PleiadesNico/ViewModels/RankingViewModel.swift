//
//  RankingViewModel.swift
//  XML_Sample
//
//  Created by katot on 2021/04/03.
//

import Foundation
import Combine

final class RankingViewModel: ObservableObject {

    typealias Genre = RankingAPI.Genre
    typealias Term  = RankingAPI.Term
    typealias Rank  = RankingAPI.Item
    
    @Published var showSelector : Bool    = false
    @Published var genreId      : Int     = 0
    @Published var termId       : Int     = 0
    @Published var ranks        : [Rank]  = []
    @Published var genres       : [Genre] = RankingAPI.genres
    @Published var terms        : [Term]  = RankingAPI.terms
    @Published var abstractText : String  = ""

    private let rankingApi  : RankingAPI
    private let session     : NicoSession
    private var appearCount : Int


    init(){
        self.rankingApi  = RankingAPI()
        self.session     = NicoSession()
        self.appearCount = 0
    }


    func onAppearRanking(){
        if self.appearCount == 0 {
            loadRanking()
        }

        self.appearCount += 1
    }

    func loadRanking(){
        self.ranks       = []

        let genreDescription = rankingApi.genreDescription(genreId: self.genreId)
        let termDescription  = rankingApi.termDescription(termId: self.termId)
        self.abstractText    = "\(genreDescription) - \(termDescription)"

        self.session.get(
            urlText    : rankingApi.url(genreId: self.genreId, termId: self.termId),
            onReceived : {text in
                self.ranks = self.rankingApi.decodeXml(text)
            },
            onError: { error in
                print(error)
            }
        )
    }


    func updateGenre(_ newGenreId : Int ){
        self.genreId  = newGenreId
        loadRanking()
    }

    
    func updateTerm(_ newTermId : Int ){
        self.termId   = newTermId
        loadRanking()
    }

    func onSelectorEnabled(){
        self.showSelector = true
    }

}
