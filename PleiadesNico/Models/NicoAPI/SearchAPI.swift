//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation

class SearchAPI {

    static let unitNum = 10

    func url(word : String, kind : Kind, offset : Int = 0 ) -> String{
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

        return NicoURL.searchBase + reduced
    }


    func decode(_ text : String) -> [SearchAPI.Result.Item]{
        let data     = text.data(using: .utf8)
        let decorder = JSONDecoder()
        guard let decodeResp = try? decorder.decode(SearchAPI.Result.self, from: data!) else {
            DebugLog.shared.error("Json decode エラー")
            return []
        }
        
        return decodeResp.data
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
