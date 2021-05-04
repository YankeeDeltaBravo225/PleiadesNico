//
//  RankingViewModel.swift
//  XML_Sample
//
//  Created by katot on 2021/04/03.
//

import Foundation
import Combine

final class RankingViewModel: ObservableObject {

    typealias Rank = NicoRanking.Item
    
    @Published var showSelector: Bool       = false
    @Published var genreId     : Int        = 0
    @Published var ranks       : [Rank]     = []
    @Published var genreText   : String     = ""

    private let session     : NicoSession
    private var appearCount : Int


    init(){
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
        self.genreText = NicoRanking.genreDescription(genreId: genreId)
        
        self.session.get(
            urlText    : NicoRanking.url(genreId: genreId),
            onReceived : {text in
                self.ranks = NicoRanking.loadXML(text)
            }
        )
    }
    
    
    func genres() -> [NicoRanking.Genre] {
        return NicoRanking.genres
    }


    func updateGenre(_ rawNewGenreId : Int?){
        guard let newGenreId = rawNewGenreId
        else {
            return
        }

        let isChanged = (genreId != newGenreId)
        genreId = newGenreId
        
        if isChanged{
            loadRanking()
        }
    }


    func onSelectorEnabled(){
        showSelector = true
    }

}
