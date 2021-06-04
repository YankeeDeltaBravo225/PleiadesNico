//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

//
// This Struct is created from actual Json using
// https://app.quicktype.io/
//

import Foundation


class DmcSessionInfo {

    // MARK: - ApiData
    struct ApiData: Codable {
        let comment: DmcSessionInfoComment
        let media: Media
        let video: DmcSessionInfoVideo
        let viewer: DmcSessionInfoViewer?

        enum CodingKeys: String, CodingKey {
            case comment = "comment"
            case media = "media"
            case video = "video"
            case viewer = "viewer"
        }
    }

    // MARK: - DmcSessionInfoComment
    struct DmcSessionInfoComment: Codable {
        let server: Server
        let keys: Keys
        let layers: [Layer]
        let threads: [Thread]
        let isAttentionRequired: Bool

        enum CodingKeys: String, CodingKey {
            case server = "server"
            case keys = "keys"
            case layers = "layers"
            case threads = "threads"
            case isAttentionRequired = "isAttentionRequired"
        }
    }

    // MARK: - Keys
    struct Keys: Codable {
        let userKey: String

        enum CodingKeys: String, CodingKey {
            case userKey = "userKey"
        }
    }

    // MARK: - Layer
    struct Layer: Codable {
        let index: Int
        let isTranslucent: Bool
        let threadIDS: [ThreadID]

        enum CodingKeys: String, CodingKey {
            case index = "index"
            case isTranslucent = "isTranslucent"
            case threadIDS = "threadIds"
        }
    }

    // MARK: - ThreadID
    struct ThreadID: Codable {
        let id: Int
        let fork: Int

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case fork = "fork"
        }
    }

    // MARK: - Server
    struct Server: Codable {
        let url: String

        enum CodingKeys: String, CodingKey {
            case url = "url"
        }
    }

    // MARK: - Thread
    struct Thread: Codable {
        let id: Int
        let fork: Int
        let isActive: Bool
        let isDefaultPostTarget: Bool
        let isEasyCommentPostTarget: Bool
        let isLeafRequired: Bool
        let isOwnerThread: Bool
        let isThreadkeyRequired: Bool
        let is184Forced: Bool
        let hasNicoscript: Bool
        let label: String
        let postkeyStatus: Int
        let server: String

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case fork = "fork"
            case isActive = "isActive"
            case isDefaultPostTarget = "isDefaultPostTarget"
            case isEasyCommentPostTarget = "isEasyCommentPostTarget"
            case isLeafRequired = "isLeafRequired"
            case isOwnerThread = "isOwnerThread"
            case isThreadkeyRequired = "isThreadkeyRequired"
            case is184Forced = "is184Forced"
            case hasNicoscript = "hasNicoscript"
            case label = "label"
            case postkeyStatus = "postkeyStatus"
            case server = "server"
        }
    }

    // MARK: - Media
    struct Media: Codable {
        let delivery: Delivery

        enum CodingKeys: String, CodingKey {
            case delivery = "delivery"
        }
    }

    // MARK: - Delivery
    struct Delivery: Codable {
        let recipeID: String
        let movie: Movie

        enum CodingKeys: String, CodingKey {
            case recipeID = "recipeId"
            case movie = "movie"
        }
    }

    // MARK: - Movie
    struct Movie: Codable {
        let contentID: String
        let audios: [Audio]
        let videos: [VideoElement]
        let session: MovieSession

        enum CodingKeys: String, CodingKey {
            case contentID = "contentId"
            case audios = "audios"
            case videos = "videos"
            case session = "session"
        }
    }

    // MARK: - Audio
    struct Audio: Codable {
        let id: String
        let isAvailable: Bool

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case isAvailable = "isAvailable"
        }
    }

    // MARK: - MovieSession
    struct MovieSession: Codable {
        let recipeID: String
        let playerID: String
        let videos: [String]
        let audios: [String]
        let protocols: [String]
        let authTypes: PurpleAuthTypes
        let serviceUserID: String
        let token: String
        let signature: String
        let contentID: String
        let heartbeatLifetime: Int
        let contentKeyTimeout: Int
        let priority: Double
        let transferPresets: [String]
        let urls: [URLElement]

        enum CodingKeys: String, CodingKey {
            case recipeID = "recipeId"
            case playerID = "playerId"
            case videos = "videos"
            case audios = "audios"
            case protocols = "protocols"
            case authTypes = "authTypes"
            case serviceUserID = "serviceUserId"
            case token = "token"
            case signature = "signature"
            case contentID = "contentId"
            case heartbeatLifetime = "heartbeatLifetime"
            case contentKeyTimeout = "contentKeyTimeout"
            case priority = "priority"
            case transferPresets = "transferPresets"
            case urls = "urls"
        }
    }

    // MARK: - PurpleAuthTypes
    struct PurpleAuthTypes: Codable {
        let http: String?
        let hls: String

        enum CodingKeys: String, CodingKey {
            case http = "http"
            case hls = "hls"
        }
    }

    // MARK: - URLElement
    struct URLElement: Codable {
        let url: String
        let isWellKnownPort: Bool
        let isSSL: Bool

        enum CodingKeys: String, CodingKey {
            case url = "url"
            case isWellKnownPort = "isWellKnownPort"
            case isSSL = "isSsl"
        }
    }

    // MARK: - VideoElement
    struct VideoElement: Codable {
        let id: String
        let isAvailable: Bool

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case isAvailable = "isAvailable"
        }
    }

    // MARK: - DmcSessionInfoVideo
    struct DmcSessionInfoVideo: Codable {
        let id: String
        let title: String
        let videoDescription: String
        let duration: Int
        let registeredAt: String?
        let isPrivate: Bool
        let isDeleted: Bool
        let isNoBanner: Bool
        let isAuthenticationRequired: Bool
        let isEmbedPlayerAllowed: Bool
        let watchableUserTypeForPayment: String
        let commentableUserTypeForPayment: String

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case title = "title"
            case videoDescription = "description"
            case duration = "duration"
            case registeredAt = "registeredAt"
            case isPrivate = "isPrivate"
            case isDeleted = "isDeleted"
            case isNoBanner = "isNoBanner"
            case isAuthenticationRequired = "isAuthenticationRequired"
            case isEmbedPlayerAllowed = "isEmbedPlayerAllowed"
            case watchableUserTypeForPayment = "watchableUserTypeForPayment"
            case commentableUserTypeForPayment = "commentableUserTypeForPayment"
        }
    }

    // MARK: - DmcSessionInfoViewer
    struct DmcSessionInfoViewer: Codable {
        let id: Int
        let nickname: String
        let isPremium: Bool

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case nickname = "nickname"
            case isPremium = "isPremium"
        }
    }

}
