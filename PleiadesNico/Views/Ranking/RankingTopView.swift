//
//  RankingTopView.swift
//  XML_Sample
//
//  Created by katot on 2021/04/03.
//

import SwiftUI

struct RankingTopView: View {

    @ObservedObject var viewModel : RankingViewModel
    
    init(){
        viewModel = RankingViewModel()
    }

    var body: some View {
        NavigationView {
            VStack{
                List{
                    ForEach(viewModel.ranks, id:\.pos) { rank in
                        NavigationLink(
                            destination: VideoDetailView(rank.videoId, colorIndex: rank.pos)
                        ){
                            RankingRowView( rankItem:rank )
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal){
                        HStack{
                            genreSelector()
                            termSelector()
                        }
                    }
                }
            }
        }
        .onAppear(){
            viewModel.onAppearRanking()
        }
    }
}


extension RankingTopView {

    fileprivate func genreSelector() -> MenuStylePicker {
        return MenuStylePicker(
            options: viewModel.genres.map{ $0.description },
            onChangeClosure: { genreId in viewModel.updateGenre(genreId) },
            selected: viewModel.genreId
        )
    }
    

    fileprivate func termSelector() -> MenuStylePicker {
        return MenuStylePicker(
            options: viewModel.terms.map{ $0.description },
            onChangeClosure: { termId in viewModel.updateTerm(termId) },
            selected: viewModel.termId
        )
    }

}


struct RankingTopView_Previews: PreviewProvider {
    static var previews: some View {
        RankingTopView()
    }
}
