//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation

class NicoURL {

    //
    // Support page
    //
    static let supportPage = "https://twitter.com/AppsPleiades"
    

    //
    // User Agent for HTTP request
    //
    static let userAgent = "PleiadesNico/\(CommonData.appVersion) (\(supportPage)"

    //
    // General (for HTTP request)
    //
    static let origin = "https://www.nicovideo.jp/"
    static let refer  = "https://www.nicovideo.jp/"

    //
    // Login page
    //
    static let loginPage    = "https://account.nicovideo.jp"
    static let cookieDomain = ".nicovideo.jp"
    static let accountPage  = "https://account.nicovideo.jp/my/account"


    //
    // Search API URL
    //
    // detail:
    // https://site.nicovideo.jp/search-api-docs/snapshot
    //
    static let searchBase = "https://api.search.nicovideo.jp/api/v2/snapshot/video/contents/search?"


    //
    // Ranking URL
    //
    // detail:
    // https://dwango.github.io/niconico/genre_ranking/ranking_rss/
    //
    static func ranking(genre : String, term : String) -> String{
        return "https://www.nicovideo.jp/ranking/\(genre)?\(term)&rss=2.0&lang=ja-jp"
    }


    //
    // Video stream APIs ( include DMC API)
    //
    static func videoPage(_ videoId : String) -> String {
        return "https://www.nicovideo.jp/watch/" + videoId
    }

    static func dmcRequest() -> String {
        return "https://api.dmc.nico/api/sessions?_format=json"
    }

    static func commentRequest() -> String {
        return "https://nmsg.nicovideo.jp/api.json"
    }
    
    static func heartBeat(_ sessionId : String) -> String{
        return "https://api.dmc.nico/api/sessions/\(sessionId)?_format=json&_method=PUT"
    }

    
    //
    // Mylist APIs
    //
    static func mylistGroup() -> String {
        return "https://www.nicovideo.jp/api/mylistgroup/list"
    }
    
    static func mylist(_ mylistId : String) -> String {
        return "https://www.nicovideo.jp/api/mylist/list?group_id=\(mylistId)"
    }
}
