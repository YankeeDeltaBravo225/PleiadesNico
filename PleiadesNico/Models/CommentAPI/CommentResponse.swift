//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation

class CommentResponse {

    // MARK: - Response
    struct Response : Codable {
        var elements : [Element]
    }

    // MARK: - ResponseElement
    struct Element: Codable {
        let ping: Ping?
        let thread: Thread?
        let leaf: Leaf?
        let globalNumRes: GlobalNumRes?
        let chat: Chat?

        enum CodingKeys: String, CodingKey {
            case ping = "ping"
            case thread = "thread"
            case leaf = "leaf"
            case globalNumRes = "global_num_res"
            case chat = "chat"
        }
    }

    // MARK: - Chat
    struct Chat: Codable {
        let thread: String?
        let no: Int?
        let vpos: Int?
        let leaf: Int?
        let date: Int?
        let dateUsec: Int?
        let nicoru: Int?
        let lastNicoruDate: String?
        let valhalla: Int?
        let anonymity: Int?
        let userID: String?
        let mail: String?
        let content: String?
        let premium: Int?
        let score: Int?
        let deleted: Int?
        let fork: Int?

        enum CodingKeys: String, CodingKey {
            case thread = "thread"
            case no = "no"
            case vpos = "vpos"
            case leaf = "leaf"
            case date = "date"
            case dateUsec = "date_usec"
            case nicoru = "nicoru"
            case lastNicoruDate = "last_nicoru_date"
            case valhalla = "valhalla"
            case anonymity = "anonymity"
            case userID = "user_id"
            case mail = "mail"
            case content = "content"
            case premium = "premium"
            case score = "score"
            case deleted = "deleted"
            case fork = "fork"
        }
    }

    // MARK: - GlobalNumRes
    struct GlobalNumRes: Codable {
        let thread: String
        let numRes: Int

        enum CodingKeys: String, CodingKey {
            case thread = "thread"
            case numRes = "num_res"
        }
    }

    // MARK: - Leaf
    struct Leaf: Codable {
        let thread: String
        let count: Int
        let leaf: Int?
        let fork: Int?

        enum CodingKeys: String, CodingKey {
            case thread = "thread"
            case count = "count"
            case leaf = "leaf"
            case fork = "fork"
        }
    }

    // MARK: - Ping
    struct Ping: Codable {
        let content: String

        enum CodingKeys: String, CodingKey {
            case content = "content"
        }
    }

    // MARK: - Thread
    struct Thread: Codable {
        let resultcode: Int?
        let thread: String?
        let serverTime: Int?
        let lastRes: Int?
        let ticket: String?
        let revision: Int?
        let fork: Int?

        enum CodingKeys: String, CodingKey {
            case resultcode = "resultcode"
            case thread = "thread"
            case serverTime = "server_time"
            case lastRes = "last_res"
            case ticket = "ticket"
            case revision = "revision"
            case fork = "fork"
        }
    }
}
