//
//  VideoAbstractView.swift
//  XML_Sample
//
//  Created by katot on 2021/04/10.
//

import SwiftUI

struct VideoAbstractView: View {

    let title     : String
    let thumbnail : String
    let uploaded  : String
    let duration  : String
    let views     : String
    let comments  : String
    
    var body: some View {
        VStack{
            titleAndThumbnailView()
            uploadDateView()
            videoStatsView()
        }
        .frame(height : 100)
    }
}

extension VideoAbstractView {
    
    fileprivate func titleAndThumbnailView() -> some View {
        return HStack {
            OnlineImageIView(
                urlText : thumbnail,
                width   : 100,
                height  : 75
            )
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 12))
                    .lineLimit(3)
            }
            Spacer()
        }
    }


    fileprivate func uploadDateView() -> some View {
        return HStack{
            Spacer()
                .frame(width:4)
            PropertyLabelView(
                symbol: "calendar",
                text  : uploaded,
                size  : 12
            )
            Spacer()
        }
    }


    fileprivate func videoStatsView() -> some View {
        return HStack{
            Spacer()
                .frame(width:4)
            PropertyLabelView(
                symbol: "clock",
                text  : duration,
                size  : 12
            )
            PropertyLabelView(
                symbol: "play",
                text  : views,
                size  : 12
            )
            PropertyLabelView(
                symbol: "text.bubble",
                text  : comments,
                size  :12
            )
            Spacer()
        }
    }
    
}


struct VideoAbstractView_Previews: PreviewProvider {
    static var previews: some View {
        VideoAbstractView(
            title    : "鎌倉幕府の成立から崩壊まで",
            thumbnail: "https://nicovideo.cdn.nimg.jp/thumbnails/38496906/38496906.66501077",
            uploaded : "2192/11/8 19:21:30",
            duration : "11:92",
            views    : "123456",
            comments : "3421"
        )
    }
}
