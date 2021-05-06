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
    static func ranking(genreId : Int, termId : Int) -> String{
        let genre = rankingGenres[genreId]
        let term  = rankingTerms[termId]
        return "https://www.nicovideo.jp/ranking/\(genre.name)?\(term.name)&rss=2.0&lang=ja-jp"
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
        RankingGenre( 0, "genre/all",                   "全ジャンル"),
        RankingGenre( 1, "hot-topic",                   "話題"),
        RankingGenre( 2, "genre/entertainment",         "エンターテイメント"),
        RankingGenre( 3, "genre/radio",                 "ラジオ"),
        RankingGenre( 4, "genre/music_sound",           "音楽・サウンド"),
        RankingGenre( 5, "genre/dance",                 "ダンス"),
        RankingGenre( 6, "genre/animal",                "動物"),
        RankingGenre( 7, "genre/nature",                "自然"),
        RankingGenre( 8, "genre/cooking",               "料理"),
        RankingGenre( 9, "genre/traveling_outdoor",     "旅行・アウトドア"),
        RankingGenre(10, "genre/vehicle",               "乗り物"),
        RankingGenre(11, "genre/sports",                "スポーツ"),
        RankingGenre(12, "genre/society_politics_news", "社会・政治・時事"),
        RankingGenre(13, "genre/technology_craft",      "技術・工作"),
        RankingGenre(14, "genre/commentary_lecture",    "解説・講座"),
        RankingGenre(15, "genre/anime",                 "アニメ"),
        RankingGenre(16, "genre/game",                  "ゲーム"),
        RankingGenre(17, "genre/other",                 "その他")
    ]

    struct RankingTerm{
        let id          : Int
        let name        : String
        let description : String
        
        init(_ termId: Int, _ termName: String, _ termDescription: String){
            id          = termId
            name        = termName
            description = termDescription
        }
    }

    static let rankingTerms : [RankingTerm] = [
        RankingTerm( 0, "term=hour",  "1時間"),
        RankingTerm( 1, "term=24h",   "24時間"),
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
