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
            title         : item.title,
            thumbnail     : item.thumbnailUrl,
            uploaded      : TextFormat.shared.dateFromISO8601(item.startTime),
            duration      : TextFormat.shared.duration(item.lengthSeconds),
            views         : String(item.viewCounter),
            comments      : String(item.commentCounter),
            mylists       : String(item.mylistCounter),
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
        let item = SearchViewModel.ResultItem(
            contentId       : "sm1192296",
            title           : "北条家の興亡と馬謖の熱い夜",
            startTime       : "2018-12-03T23:59:02+09:00",
            lastCommentTime : "2020-12-04T23:30:56+09:00",
            thumbnailUrl    : "https://nicovideo.cdn.nimg.jp/thumbnails/34263709/34263709",
            viewCounter     : 5296,
            mylistCounter   : 7,
            lengthSeconds   : 30,
            commentCounter  : 40)
        SearchResultRowView(item: item, index: 6)
    }
}
