//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI

struct SearchResultRowView: View {
    
    let item  : SearchViewModel.ResultItem
    let index : Int
    
    var body: some View {
        VideoAbstractView(
            attribute     : item,
            colorIndex    : index,
            imageWidth    : 96,
            imageHeight   : 54, // 16:9 aspact rate
            titleFontSize : 14,
            attrFontSize  : 14
        )
    }
}

struct SearchResultRowView_Previews: PreviewProvider {
    static var previews: some View {
        let attr = CommonData.VideoAttribute(
            number          : 1192,
            contentId       : "sm1192296",
            title           : "北条家の興亡と馬謖の熱い夜",
            thumbnail       : "https://nicovideo.cdn.nimg.jp/thumbnails/34263709/34263709",
            uploaded        : "1192/08/11",
            duration        : "11:9.2",
            views           : "1192",
            comments        : "9211",
            mylists         : "1192296"
        )

        SearchResultRowView(item: attr, index: 6)
    }
}
