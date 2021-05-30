//
//  VideoAbstractView.swift
//  XML_Sample
//
//  Created by katot on 2021/04/10.
//

import SwiftUI

struct VideoAbstractView: View {

    let attribute     : CommonData.VideoAttribute
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
                .shadow(color: .gray, radius: 2, x: 2, y: 2)
            VStack(alignment: .leading) {
                Text(attribute.title)
                    .font(.system(size: titleFontSize))
            }
            .frame(height: imageHeight)
            Spacer()
        }
    }


    fileprivate func thumbnailView() -> some View {
        return ZStack{
            OnlineImageIView( urlText : attribute.thumbnail, width : imageWidth, height : imageWidth * 0.75 )
                .mask(
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width : imageWidth, height: imageHeight)
                )
                .frame(width: imageWidth, height: imageHeight)        
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Text(attribute.duration)
                        .font(.system(size: attrFontSize))
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(4.0)
                        .padding(2)
                }
            }
        }
        .frame(width: imageWidth, height: imageHeight)
    }


    fileprivate func uploadDateView() -> some View {
        return HStack{
            Spacer()
                .frame(width:4)
            propertyLabelView(
                symbol: "calendar",
                text  : attribute.uploaded,
                size  : attrFontSize
            )
            Spacer()
        }
    }


    fileprivate func videoStatsView() -> some View {
        return HStack{
            Spacer()
                .frame(width:4)
            propertyLabelView(
                symbol: "play",
                text  : TextFormat.shared.largeCount(attribute.views),
                size  : attrFontSize
            )
            propertyLabelView(
                symbol: "text.bubble",
                text  : TextFormat.shared.largeCount(attribute.comments),
                size  : attrFontSize
            )
            propertyLabelView(
                symbol: "star",
                text  : TextFormat.shared.largeCount(attribute.mylists),
                size  : attrFontSize
            )
            Spacer()
        }
    }
    
    fileprivate func propertyLabelView(symbol : String, text : String, size : CGFloat) -> some View {
        return HStack{
            Image(systemName: symbol)
                .resizable()
                .frame(width:size, height:size)
            Text(text)
                .font(.system(size: size))
            Spacer()
        }
    }
    
}


struct VideoAbstractView_Previews: PreviewProvider {
    static var previews: some View {
        VideoAbstractView(
            attribute   : mockVideoAttribte,
            colorIndex  : 3,
            imageWidth  : 160,
            imageHeight : 90,
            titleFontSize: 16,
            attrFontSize: 12
        )
    }
}
