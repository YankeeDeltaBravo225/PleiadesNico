//
//  RankingTopView.swift
//  XML_Sample
//
//  Created by katot on 2021/04/03.
//

import SwiftUI

struct RankingView: View {

    @ObservedObject var viewModel : RankingViewModel
    
    init(){
        viewModel = RankingViewModel()
    }

    var body: some View {
        VStack{
            List{
                HStack{
                    genreSelector()
                    termSelector()
                }

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
                    Text(viewModel.abstractText)
                        .frame(width: 240)
                        .lineLimit(1)
                }
            }
        }
        .onAppear(){
            viewModel.onAppearRanking()
        }
    }
}


extension RankingView {

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


struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView()
    }
}
