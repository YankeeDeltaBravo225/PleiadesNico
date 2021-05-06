//
//  RankingViewModel.swift
//  XML_Sample
//
//  Created by katot on 2021/04/03.
//

import Foundation
import Combine

final class RankingViewModel: ObservableObject {

    typealias Rank = RankingAPI.Item
    
    @Published var showSelector: Bool                   = false
    @Published var genreId     : Int                    = 0
    @Published var termId      : Int                    = 0
    @Published var ranks       : [Rank]                 = []
    @Published var genreText   : String                 = ""
    @Published var genres      : [NicoURL.RankingGenre] = NicoURL.rankingGenres
    @Published var terms       : [NicoURL.RankingTerm]  = NicoURL.rankingTerms
    
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
        self.genreText = rankingApi.genreDescription(genreId: self.genreId)
        
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


    func updateGenre(rawNewGenreId : Int?, newTermId : Int){
        guard let newGenreId = rawNewGenreId
        else {
            return
        }

        let isUpdated = (self.genreId != newGenreId) || (self.termId != newTermId)

        if isUpdated {
            self.genreId  = newGenreId
            self.termId   = newTermId

            loadRanking()
        }
    }


    func onSelectorEnabled(){
        self.showSelector = true
    }

}
