//
//  VideoAbstractView.swift
//  XML_Sample
//
//  Created by katot on 2021/04/10.
//

import SwiftUI

struct VideoAbstractView: View {

    let title         : String
    let thumbnail     : String
    let uploaded      : String
    let duration      : String
    let views         : String
    let comments      : String
    let mylists       : String
    let colorIndex    : Int
    let imageWidth    : CGFloat
    let imageHeight   : CGFloat
    let titleFontSize : CGFloat
    let attrFontSize  : CGFloat
        
    var body: some View {
        VStack{
            indexColorView()
            VStack{
                titleAndThumbnailView()
                uploadDateView()
                videoStatsView()
            }
        }
    }
}

extension VideoAbstractView {

    fileprivate func indexColorView() -> some View {
        return ColorPalette.pastelColor(colorIndex)
            .frame(height:4)
    }
 

    fileprivate func titleAndThumbnailView() -> some View {
        return HStack {
            thumbnailView()
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: titleFontSize))
            }
            .frame(height: imageHeight)
            Spacer()
        }
    }


    fileprivate func thumbnailView() -> some View {
        return ZStack{
            OnlineImageIView(
                urlText : thumbnail,
                width   : imageWidth,
                height  : imageHeight
            )
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Text(duration)
                        .font(.system(size: attrFontSize))
                        .foregroundColor(.white)
                        .background(Color.black)
                }
            }
        }
        .frame(width: imageWidth, height: imageHeight)
    }


    fileprivate func uploadDateView() -> some View {
        return HStack{
            Spacer()
                .frame(width:4)
            PropertyLabelView(
                symbol: "calendar",
                text  : uploaded,
                size  : attrFontSize
            )
            Spacer()
        }
    }


    fileprivate func videoStatsView() -> some View {
        return HStack{
            Spacer()
                .frame(width:4)
            PropertyLabelView(
                symbol: "play",
                text  : TextFormat.shared.largeCount(views),
                size  : attrFontSize
            )
            PropertyLabelView(
                symbol: "text.bubble",
                text  : TextFormat.shared.largeCount(comments),
                size  : attrFontSize
            )
            PropertyLabelView(
                symbol: "star",
                text  : TextFormat.shared.largeCount(mylists),
                size  : attrFontSize
            )
            Spacer()
        }
    }
    
}


struct VideoAbstractView_Previews: PreviewProvider {
    static var previews: some View {
        VideoAbstractView(
            title       : "鎌倉幕府の成立から崩壊まで",
            thumbnail   : "https://nicovideo.cdn.nimg.jp/thumbnails/38496906/38496906.66501077",
            uploaded    : "2192/11/8 19:21:30",
            duration    : "11:92",
            views       : "123456",
            comments    : "3421",
            mylists     : "765",
            colorIndex  : 3,
            imageWidth  : 160,
            imageHeight : 90,
            titleFontSize: 16,
            attrFontSize: 12
        )
    }
}
