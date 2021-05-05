//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation

class NicoURL {
    
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
        let genre = rankingGenres[genreId]
        return "https://www.nicovideo.jp/ranking/genre/\(genre.name)?video_ranking_menu&rss=2.0&lang=ja-jp"
    }

    struct RankingGenre{
        let id          : Int
        let name        : String
        let description : String
        
        init(_ genreId: Int, _ genreName: String, _ genreDescription: String){
            id          = genreId
            name        = genreName
            description = genreDescription
        }
    }

    static let rankingGenres : [RankingGenre] = [
        RankingGenre( 0, "all",                   "全ジャンル"),
        RankingGenre( 1, "hot-topic",             "話題"),
        RankingGenre( 2, "entertainment",         "エンターテイメント"),
        RankingGenre( 3, "radio",                 "ラジオ"),
        RankingGenre( 4, "music_sound",           "音楽・サウンド"),
        RankingGenre( 5, "dance",                 "ダンス"),
        RankingGenre( 6, "animal",                "動物"),
        RankingGenre( 7, "nature",                "自然"),
        RankingGenre( 8, "cooking",               "料理"),
        RankingGenre( 9, "traveling_outdoor",     "旅行・アウトドア"),
        RankingGenre(10, "vehicle",               "乗り物"),
        RankingGenre(11, "sports",                "スポーツ"),
        RankingGenre(12, "society_politics_news", "社会・政治・時事"),
        RankingGenre(13, "technology_craft",      "技術・工作"),
        RankingGenre(14, "commentary_lecture",    "解説・講座"),
        RankingGenre(15, "anime",                 "アニメ"),
        RankingGenre(16, "game",                  "ゲーム"),
        RankingGenre(17, "other",                 "その他")
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
