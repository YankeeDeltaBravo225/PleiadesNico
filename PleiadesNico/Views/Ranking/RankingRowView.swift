//
//  RankingRowView.swift
//  XML_Sample
//
//  Created by katot on 2021/04/02.
//

import SwiftUI

struct RankingRowView: View {
    let item      : RankingAPI.Item
    let color     : ColorPalette.RGBColor
    
    init( rankItem : RankingAPI.Item){
        item      = rankItem
        color     = ColorPalette.pastel( item.pos )
    }

    
    var body: some View {
        HStack{
            Color(red: color.r, green: color.g, blue: color.b)
                .frame(width:4)
            ZStack(alignment: .topLeading) {
                VStack{
                    VideoAbstractView(
                        title    : item.title,
                        thumbnail: item.thumbnail,
                        uploaded : item.uploaded,
                        duration : item.duration,
                        views    : item.views,
                        comments : item.comments,
                        mylists  : item.mylists
                    )
                }
                rankPositionView()
            }
        }
        .frame(height: 100)
//        .cornerRadius(10)
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
