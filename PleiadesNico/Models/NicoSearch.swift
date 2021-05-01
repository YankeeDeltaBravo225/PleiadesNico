//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation

// API spec:
//https://site.nicovideo.jp/search-api-docs/snapshot
//
// Example:
// https://api.search.nicovideo.jp/api/v2/snapshot/video/contents/search?q=BF5&targets=title,description,tags&fields=contentId,title,viewCounter,mylistCounter,lengthSeconds,commentCounter,startTime,lastCommentTime,thumbnailUrl&_sort=-viewCounter&_context=SwiftSampleApp&_offset=100


class NicoSearch {
    
    static let baseUrl = "https://api.search.nicovideo.jp/api/v2/snapshot/video/contents/search?"
    static let unitNum = 10
    

    static func url(word : String, kind : Kind, offset : Int = 0 ) -> String{
        let targets = (kind == .tag) ? "tags" : "title,description,tags"
        let fields  = "contentId,title,viewCounter,mylistCounter,lengthSeconds,commentCounter,startTime,lastCommentTime,thumbnailUrl"
        
        let queries : [Query] = [
            Query( "q",        word.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "" ),
            Query( "targets",  targets ),
            Query( "fields",   fields ),
            Query( "_sort",    "-viewCounter" ),
            Query( "_context", "SwiftSampleApp" ),
            Query( "_offset",  String(offset))
        ]

        let reduced = queries.reduce("") {$0 + $1.key + "=" + $1.value + "&"}

        return baseUrl + reduced
    }


    struct Result : Codable, Hashable{
        struct Item : Codable, Hashable {
            var contentId       : String
            var title           : String
            var startTime       : String
            var lastCommentTime : String
            var thumbnailUrl    : String
            var viewCounter     : Int
            var mylistCounter   : Int
            var lengthSeconds   : Int
            var commentCounter  : Int
        }
        
        var data : [Item]
    }
    

    struct Query{
        var key   : String
        var value : String
        
        init(_ key : String, _ value : String){
            self.key   = key
            self.value = value
        }
    }

    enum Kind: String, CaseIterable {
        case tag
        case keyword
    }
    
    
}
