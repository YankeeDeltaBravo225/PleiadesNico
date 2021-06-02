//
//  RankingTopView.swift
//  XML_Sample
//
//  Created by katot on 2021/04/03.
//

import SwiftUI

struct RankingView: View {

    @ObservedObject var rankingViewModel      : RankingViewModel
    @ObservedObject var pullDetectorViewModel : PullDetectorViewModel
    
    init(){
        let rankingViewModel      = RankingViewModel()
        let pullDetectorViewModel = PullDetectorViewModel(
            threshold : 50,
            onStart   : { rankingViewModel.loadRanking() },
            onFinish  : {}
        )

        self.rankingViewModel      = rankingViewModel
        self.pullDetectorViewModel = pullDetectorViewModel
    }

        
    var body: some View {
        ZStack{
            List{
                VStack{
                    PullDetector( viewModel: self.pullDetectorViewModel )
                    genreSelector()
                    termSelector()
                }

                ForEach(rankingViewModel.ranks, id:\.number) { rank in
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
                    Text(rankingViewModel.abstractText)
                        .frame(width: 240)
                        .lineLimit(1)
                }
            }
            loadingStatusView()
        }
        .onAppear(){
            rankingViewModel.onAppearRanking()
        }
    }
}


extension RankingView {

    fileprivate func genreSelector() -> MenuStylePicker {
        return MenuStylePicker(
            options: rankingViewModel.genreOptions(),
            onChangeClosure: { genreId in rankingViewModel.updateGenre(genreId) },
            color1 : .red,
            color2 : .purple,
            selected: rankingViewModel.genreId
        )
    }
    

    fileprivate func termSelector() -> SegmentStylePicker {
        return SegmentStylePicker(
            options: rankingViewModel.termOptions(),
            onChangeClosure: { termId in rankingViewModel.updateTerm(termId) },
            selected: rankingViewModel.termId
        )
    }


    fileprivate func loadingStatusView() -> some View {
        return VStack{
            HStack{
                Spacer()
                if rankingViewModel.showLoading {
                    ProgressView()
                        .padding(10)
                }
                Spacer()
            }
            Spacer()
        }
    }

}


struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView()
    }
}
