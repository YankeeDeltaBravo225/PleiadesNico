//
//  RankingRowView.swift
//  XML_Sample
//
//  Created by katot on 2021/04/02.
//

import SwiftUI

struct RankingRowView: View {
    let item      : RankingViewModel.Rank
    
    init( rankItem : RankingViewModel.Rank){
        item      = rankItem
    }


    var body: some View {
        ZStack(alignment: .topLeading) {
            VideoAbstractView(
                attribute     : item,
                colorIndex    : item.number,
                imageWidth    : 96,
                imageHeight   : 54, // 16:9 aspact rate
                titleFontSize : 14,
                attrFontSize  : 14
            )
            rankPositionView()
        }
    }

}


extension RankingRowView {

    fileprivate func rankPositionView() -> some View {
        return HStack{
            Spacer()
                .frame(width : 4)
            VStack{
                Spacer()
                    .frame(height : 4)
                Text(String(item.number))
                    .foregroundColor(.white)
                    
                    .font(.system(size: 28))
                    .background(
                        Capsule()
                            .fill(Color.black)
                            .opacity(0.6)
                    )
            }
        }
    }
    
}


struct RankingRowView_Previews: PreviewProvider {
    static var previews: some View {
        RankingRowView(rankItem: mockVideoAttribte)
    }
}
