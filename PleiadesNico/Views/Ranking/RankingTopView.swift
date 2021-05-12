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
                    HStack{
                        genreSelectButton()
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
                    }
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
    fileprivate func genreSelectButton() -> FloatingButton {
        return FloatingButton(
            action: {viewModel.onSelectorEnabled()},
            systemIcon: "text.justify",
            text: viewModel.genreText
        )
    }
}


struct RankingTopView_Previews: PreviewProvider {
    static var previews: some View {
        RankingTopView()
    }
}
