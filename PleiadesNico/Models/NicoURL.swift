//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation

class NicoURL {

    //
    // Login page
    //
    static let loginPage    = "https://account.nicovideo.jp"
    static let cookieDomain = ".nicovideo.jp"
    static let accountPage  = "https://account.nicovideo.jp/my/account"


    //
    // Search API URL
    //
    // spec: https://site.nicovideo.jp/search-api-docs/snapshot
    //
    static let searchBase = "https://api.search.nicovideo.jp/api/v2/snapshot/video/contents/search?"


    //
    // Ranking URL
    //
    // API detail:
    // https://dwango.github.io/niconico/genre_ranking/ranking_rss/
    //
    static func ranking(genreId : Int) -> String{
        let genre   = genres[genreId]
        return "https://www.nicovideo.jp/ranking/genre/\(genre.name)?video_ranking_menu&rss=2.0&lang=ja-jp"
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

}
