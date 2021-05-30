//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation

class SearchAPI {

    enum Kind: Int, CaseIterable, Equatable {
        case tag     = 0
        case keyword = 1
    }

    struct Query{
        var key   : String
        var value : String
        
        init(_ key : String, _ value : String){
            self.key   = key
            self.value = value
        }
    }

    struct Result : Codable, Hashable{
        struct Item : Codable, Hashable {
            var contentId       : String
            var title           : String
            var startTime       : String
            var lastCommentTime : String?
            var thumbnailUrl    : String
            var viewCounter     : Int
            var mylistCounter   : Int
            var lengthSeconds   : Int
            var commentCounter  : Int
        }
        
        var data : [Item]
    }

    enum SortOrder: Int, CaseIterable {
        case minus = 0
        case plus  = 1
    }
    
    struct SortDirection{
        let order       : SortOrder
        let description : String

        init(_ order: SortOrder, _ description: String){
            self.order             = order
            self.description       = description
        }
    }
    
    struct SortKey{
        let id          : Int
        let name        : String
        let description : String
        let directions  : [SortDirection]
        
        init(_ keyId: Int, _ keyName: String, _ description: String, _ directions : [SortDirection]){
            self.id          = keyId
            self.name        = keyName
            self.description = description
            self.directions  = directions
        }
    }

    static let sortKeys : [SortKey] = [
        SortKey(0, "viewCounter",     "再生数",      [SortDirection(.minus, "多い順"),   SortDirection(.plus, "少ない順")] ),
        SortKey(1, "commentCounter",  "コメント",    [SortDirection(.minus, "多い順"),   SortDirection(.plus, "少ない順")] ),
        SortKey(2, "mylistCounter",   "マイリス",    [SortDirection(.minus, "多い順"),   SortDirection(.plus, "少ない順")]) ,
        SortKey(3, "startTime",       "投稿時間",    [SortDirection(.minus, "新しい順"), SortDirection(.plus, "古い順")] ),
        SortKey(4, "lastCommentTime", "最新コメ",    [SortDirection(.minus, "新しい順"), SortDirection(.plus, "古い順")] ),
        SortKey(5, "lengthSeconds",   "再生時間",    [SortDirection(.minus, "長い順"),   SortDirection(.plus, "短い順")] ),
    ]

    
    
    
    static let unitNum = 10
    
    
    func url(word : String, kind : Kind, offset : Int = 0, sortKeyId : Int, sortOrderId : Int ) -> String{
        let targets = (kind == .tag) ? "tags" : "title,description,tags"
        let fields  = "contentId,title,viewCounter,mylistCounter,lengthSeconds,commentCounter,startTime,lastCommentTime,thumbnailUrl"
        
        let queries : [Query] = [
            Query( "q",        word.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "" ),
            Query( "targets",  targets ),
            Query( "fields",   fields ),
            Query( "_sort",    sortQueryValue(sortKeyId: sortKeyId, sortOrderId: sortOrderId) ),
            Query( "_context", NicoURL.userAgent.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "" ),
            Query( "_offset",  String(offset)),
        ]

        let reduced = queries.reduce("") {$0 + $1.key + "=" + $1.value + "&"}

        return NicoURL.searchBase + reduced
    }

    
    func sortQueryValue(sortKeyId : Int, sortOrderId : Int) -> String {
        let prefix = (sortOrderId == SortOrder.minus.rawValue) ? #"-"# : #"%2B"# // %2B: percent encoded value of +
        let value  = SearchAPI.sortKeys[sortKeyId].name

        let queryValue = prefix + value
        return queryValue
    }


    func decode(_ text : String) -> [SearchAPI.Result.Item]{
        
        let json : NicoJson = NicoJson(text)

        var resp : SearchAPI.Result
        do{
            resp = try json.decode(SearchAPI.Result.self)
        } catch{
            DebugLog.shared.error("error: \(error.localizedDescription)")
            DebugLog.shared.error("raw Json: \(text)")
            return []
        }

        return resp.data
    }

}
