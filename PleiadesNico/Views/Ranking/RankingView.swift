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
                    Spacer()
                    genreSelector()
                    termSelector()
                    Spacer()
                }

                ForEach(viewModel.ranks, id:\.number) { rank in
                    NavigationLink(
                        destination: VideoDetailView(rank.contentId, colorIndex: rank.number)
                    ){
                        RankingRowView( rankItem:rank )
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
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
            options: viewModel.genreOptions(),
            onChangeClosure: { genreId in viewModel.updateGenre(genreId) },
            color1 : .red,
            color2 : .purple,
            selected: viewModel.genreId
        )
    }
    

    fileprivate func termSelector() -> MenuStylePicker {
        return MenuStylePicker(
            options: viewModel.termOptions(),
            onChangeClosure: { termId in viewModel.updateTerm(termId) },
            color1 : .blue,
            color2 : .green,
            selected: viewModel.termId
        )
    }

}


struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView()
    }
}
