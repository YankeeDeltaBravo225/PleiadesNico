//
//  GenreSelectView.swift
//  XML_Sample
//
//  Created by katot on 2021/04/03.
//

import SwiftUI

struct GenreSelectView: View {
    
    @ObservedObject var viewModel : RankingViewModel
    @State private var genreId    : Int?
    @State private var termId     : Int = 0


    var body: some View {
        VStack {
            Divider()
            Text("集計期間")
            Picker(selection: $termId, label: Text("集計期間")) {
                ForEach(viewModel.terms, id:\.id) { term in
                    Text(term.description).tag(term.id)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            Divider()
            Text("ジャンル")
            List(selection: $genreId) {
                ForEach(viewModel.genres, id:\.id) { genre in
                    Text(genre.description).tag(genre.id)
                }
            }
            .environment(\.editMode, .constant(.active))
        }
        .onAppear(){
            genreId = viewModel.genreId
            termId  = viewModel.termId
        }
        .onDisappear(){
            viewModel.updateGenre( rawNewGenreId: genreId, newTermId: termId )
        }
    }
}

struct GenreSelectView_Previews: PreviewProvider {

    static var previews: some View {
        GenreSelectView( viewModel: RankingViewModel() )
    }
}
