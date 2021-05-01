//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation
import Kanna

// API detail:
// https://dwango.github.io/niconico/genre_ranking/ranking_rss/
//


class NicoRanking{

    static let genres : [Genre] = [
        Genre( 0, "all",                   "全ジャンル"),
        Genre( 1, "hot-topic",             "話題"),
        Genre( 2, "entertainment",         "エンターテイメント"),
        Genre( 3, "radio",                 "ラジオ"),
        Genre( 4, "music_sound",           "音楽・サウンド"),
        Genre( 5, "dance",                 "ダンス"),
        Genre( 6, "animal",                "動物"),
        Genre( 7, "nature",                "自然"),
        Genre( 8, "cooking",               "料理"),
        Genre( 9, "traveling_outdoor",     "旅行・アウトドア"),
        Genre(10, "vehicle",               "乗り物"),
        Genre(11, "sports",                "スポーツ"),
        Genre(12, "society_politics_news", "社会・政治・時事"),
        Genre(13, "technology_craft",      "技術・工作"),
        Genre(14, "commentary_lecture",    "解説・講座"),
        Genre(15, "anime",                 "アニメ"),
        Genre(16, "game",                  "ゲーム"),
        Genre(17, "other",                 "その他")
    ]


    struct Genre{
        let id          : Int
        let name        : String
        let description : String
        
        init(_ genreId: Int, _ genreName: String, _ genreDescription: String){
            id          = genreId
            name        = genreName
            description = genreDescription
        }
    }


    static func genreDescription(genreId : Int) -> String{
        let genre = genres[genreId]
        return genre.description
    }


    static func url(genreId : Int) -> String{
        let genre   = genres[genreId]
        return "https://www.nicovideo.jp/ranking/genre/\(genre.name)?video_ranking_menu&rss=2.0&lang=ja-jp"
    }

    
    struct Item: Hashable, Codable{
        let pos       : Int
        let comments  : String
        let mylists   : String
        let views     : String
        let videoId   : String
        let thumbnail : String
        let title     : String
        let uploaded  : String
        let duration  : String
    }


    static func loadXML(_ sourceText : String) -> [Item] {
        guard let xml = try? Kanna.XML(xml: sourceText, encoding: .utf8)
        else {
            return []
        }

        var ranks : [Item] = []
        
        let itemXpath = #"//item"#
        for (i,item) in xml.xpath(itemXpath).enumerated() {
            let htmlText = item.text ?? ""
            
            var attr = loadItem(htmlText: htmlText)

            let xpath_link = #"//link"#
            attr["link"] = item.xpath(xpath_link).first?.text
            attr["rank"] = String(i + 1)

            let rank = Item(
                pos       : i+1,
                comments  : attr["comments",  default: "no comment"],
                mylists   : attr["mylists",   default: "no mylist"],
                views     : attr["views",     default: "not view"],
                videoId   : extractUsingRegex(
                                text    : attr["link",default: "no link"],
                                pattern : "s[mo][0-9]+"
                            ),
                thumbnail : attr["thumbnail", default: ""],
                title     : attr["title",     default: "No title"],
                uploaded  : attr["uploaded",  default: "No date"],
                duration  : attr["duration",  default: "No time"]
            )

            ranks.append( rank )
        }
     
        return ranks
    }


    static func loadItem(htmlText : String) -> [String : String] {
        guard let doc = try? Kanna.HTML(html: htmlText, encoding: .utf8)
        else{
            return ["none":"none"]
        }

        let xpathes : [String : String] = [
            "thumbnail" : #"//img/@src"#,
            "title"     : #"//img/@alt"#,
            "uploaded"  : #"//strong[contains(@class, "nico-info-date")]"#,
            "duration"  : #"//strong[contains(@class, "nico-info-length")]"#,
            "views"     : #"//strong[contains(@class, "nico-info-total-view")]"#,
            "comments"  : #"//strong[contains(@class, "ico-info-total-res")]"#,
            "mylists"   : #"//strong[contains(@class, "nico-info-total-mylist")]"#,
        ]

        return xpathes.mapValues{ (doc.xpath($0).first?.text ?? "") }
    }


    static func extractUsingRegex(text: String, pattern: String) -> String {
        guard let regex = try? NSRegularExpression(pattern: pattern),
              let matches = regex.firstMatch(in: text, range: NSRange(location: 0, length: text.count))
        else {
            return ""
        }

        return NSString(string: text).substring(with: matches.range(at: 0))
    }

}
