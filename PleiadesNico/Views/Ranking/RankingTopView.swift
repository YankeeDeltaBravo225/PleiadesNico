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
                            destination: VideoDetailView(rank.videoId)
                        ){
                            RankingRowView( rankItem:rank )
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    genreSelectionButton()
                    reloadButton()
                }
            }
        }
        .onAppear(){
            viewModel.onAppearRanking()
        }
        .sheet(isPresented: $viewModel.showSelector) {
            GenreSelectView(viewModel: viewModel)
        }
    }
}


extension RankingTopView {


    
    fileprivate func genreSelectionButton() -> ToolbarItem<Void, Button<TupleView<(Image, Text)>>> {
        return ToolbarItem(placement: .navigationBarLeading){
            Button(action: { viewModel.onSelectorEnabled() }) {
                Image(systemName: "text.justify")
                Text(viewModel.genreText)
            }
        }
    }
    
    fileprivate func reloadButton() -> ToolbarItem<Void, Button<Image>> {
        return ToolbarItem(placement: .navigationBarTrailing){
            Button(action: { viewModel.loadRanking() } ){
                Image(systemName: "arrow.clockwise")
            }
        }
    }

}


struct RankingTopView_Previews: PreviewProvider {
    static var previews: some View {
        RankingTopView()
    }
}
