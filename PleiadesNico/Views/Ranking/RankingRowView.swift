//
//  RankingRowView.swift
//  XML_Sample
//
//  Created by katot on 2021/04/02.
//

import SwiftUI

struct RankingRowView: View {
    let item      : RankingAPI.Item
    
    init( rankItem : RankingAPI.Item){
        item      = rankItem
    }


    var body: some View {
        ZStack(alignment: .topLeading) {
            VideoAbstractView(
                title         : item.title,
                thumbnail     : item.thumbnail,
                uploaded      : item.uploaded,
                duration      : item.duration,
                views         : item.views,
                comments      : item.comments,
                mylists       : item.mylists,
                colorIndex    : item.pos,
                imageWidth    : 100,
                imageHeight   : 75,
                titleFontSize : 12,
                attrFontSize  : 12
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
                Text(String(item.pos))
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
        RankingRowView(rankItem: mockRank)
    }
}
