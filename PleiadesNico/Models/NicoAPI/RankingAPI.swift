//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation
import Kanna


class RankingAPI{

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

    static let genres : [Genre] = [
        Genre( 0, "genre/all",                   "全ジャンル"),
        Genre( 1, "hot-topic",                   "話題"),
        Genre( 2, "genre/entertainment",         "エンターテイメント"),
        Genre( 3, "genre/radio",                 "ラジオ"),
        Genre( 4, "genre/music_sound",           "音楽・サウンド"),
        Genre( 5, "genre/dance",                 "ダンス"),
        Genre( 6, "genre/animal",                "動物"),
        Genre( 7, "genre/nature",                "自然"),
        Genre( 8, "genre/cooking",               "料理"),
        Genre( 9, "genre/traveling_outdoor",     "旅行・アウトドア"),
        Genre(10, "genre/vehicle",               "乗り物"),
        Genre(11, "genre/sports",                "スポーツ"),
        Genre(12, "genre/society_politics_news", "社会・政治・時事"),
        Genre(13, "genre/technology_craft",      "技術・工作"),
        Genre(14, "genre/commentary_lecture",    "解説・講座"),
        Genre(15, "genre/anime",                 "アニメ"),
        Genre(16, "genre/game",                  "ゲーム"),
        Genre(17, "genre/other",                 "その他")
    ]

    struct Term{
        let id          : Int
        let name        : String
        let description : String
        
        init(_ termId: Int, _ termName: String, _ termDescription: String){
            id          = termId
            name        = termName
            description = termDescription
        }
    }

    static let terms : [Term] = [
        Term( 0, "term=hour",  "1時間"),
        Term( 1, "term=24h",   "24時間"),
    ]
    
    
    func url(genreId : Int, termId : Int) -> String {
        let genre = RankingAPI.genres[genreId]
        let term  = RankingAPI.terms[termId]
        
        return NicoURL.ranking(genre : genre.name, term : term.name)
    }


    func genreDescription(genreId : Int) -> String{
        let genre = RankingAPI.genres[genreId]
        return genre.description
    }
    
    
    func termDescription(termId : Int) -> String{
        let term = RankingAPI.terms[termId]
        return term.description
    }


    func decodeXml(_ sourceText : String) -> [Item] {
        guard let xml = try? Kanna.XML(xml: sourceText, encoding: .utf8)
        else {
            return []
        }

        var ranks : [Item] = []
        
        let itemXpath = #"//item"#
        for (i,item) in xml.xpath(itemXpath).enumerated() {
            let htmlText = item.text ?? ""
            
            var attr = extractItem(htmlText: htmlText)

            let xpath_link = #"//link"#
            attr["link"] = item.xpath(xpath_link).first?.text
            attr["rank"] = String(i + 1)

            let rank = Item(
                pos       : i+1,
                comments  : attr["comments",  default: "no comment"],
                mylists   : attr["mylists",   default: "no mylist"],
                views     : attr["views",     default: "not view"],
                videoId   : TextFormat.shared.extractByRegex(
                                text    : attr["link",default: "no link"],
                                pattern : "s[mo][0-9]+"
                            ) ?? "",
                thumbnail : attr["thumbnail", default: ""],
                title     : attr["title",     default: "No title"],
                uploaded  : attr["uploaded",  default: "No date"],
                duration  : attr["duration",  default: "No time"]
            )

            ranks.append( rank )
        }
     
        return ranks
    }


    private func extractItem(htmlText : String) -> [String : String] {
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

}
