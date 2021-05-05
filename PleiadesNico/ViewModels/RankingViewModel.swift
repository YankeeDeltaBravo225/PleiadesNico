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
    @Published var ranks       : [Rank]                 = []
    @Published var genreText   : String                 = ""
    @Published var genres      : [NicoURL.RankingGenre] = NicoURL.rankingGenres
    
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
        self.genreText = rankingApi.genreDescription(genreId: genreId)
        
        self.session.get(
            urlText    : rankingApi.url(genreId: genreId),
            onReceived : {text in
                self.ranks = self.rankingApi.decodeXml(text)
            },
            onError: { error in
                print(error)
            }
        )
    }


    func updateGenre(_ rawNewGenreId : Int?){
        guard let newGenreId = rawNewGenreId
        else {
            return
        }

        if self.genreId != newGenreId{
            self.genreId  = newGenreId
            loadRanking()
        }
    }


    func onSelectorEnabled(){
        self.showSelector = true
    }

}
