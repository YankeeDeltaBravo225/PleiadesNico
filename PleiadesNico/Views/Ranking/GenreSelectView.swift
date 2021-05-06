//
//  GenreSelectView.swift
//  XML_Sample
//
//  Created by katot on 2021/04/03.
//

import SwiftUI

struct GenreSelectView: View {
    
    @ObservedObject var viewModel : RankingViewModel
    @State  private var genreId   : Int? = 0

    var body: some View {
        VStack {
            Divider()
            Text("ジャンルを選択")
                .font(.title)
            List(selection: $genreId) {
                ForEach(viewModel.genres, id:\.id) { genre in
                    Text(genre.description).tag(genre.id)
                }
            }
            .environment(\.editMode, .constant(.active))
        }
        .onAppear(){
            genreId = viewModel.genreId
        }
        .onDisappear(){
            viewModel.updateGenre( genreId )
        }
    }
}

struct GenreSelectView_Previews: PreviewProvider {

    static var previews: some View {
        GenreSelectView( viewModel: RankingViewModel() )
    }
}
