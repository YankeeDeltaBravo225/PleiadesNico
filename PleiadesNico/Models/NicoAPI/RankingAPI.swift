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

    
    func url(genreId : Int) -> String {
        NicoURL.ranking(genreId : genreId)
    }


    func genreDescription(genreId : Int) -> String{
        let genre = NicoURL.rankingGenres[genreId]
        return genre.description
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


    private func extractUsingRegex(text: String, pattern: String) -> String {
        guard let regex = try? NSRegularExpression(pattern: pattern),
              let matches = regex.firstMatch(in: text, range: NSRange(location: 0, length: text.count))
        else {
            return ""
        }

        return NSString(string: text).substring(with: matches.range(at: 0))
    }

}
