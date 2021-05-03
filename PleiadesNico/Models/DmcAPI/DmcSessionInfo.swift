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

        let ads: JSONNull?
        let category: JSONNull?
        let channel: JSONNull?
        let client: Client?
        let comment: DmcSessionInfoComment
//        let community: JSONNull?
        let easyComment: EasyComment?
        let external: External?
        let genre: DmcSessionInfoGenre?
        let marquee: Marquee?
        let media: Media
        let okReason: String?
        let owner: DmcSessionInfoOwner?
//        let payment: Payment
//        let pcWatchPage: PCWatchPage?
//        let player: Player?
//        let ppv: JSONNull?
//        let ranking: Ranking
//        let series: Series
//        let smartphone: JSONNull?
//        let system: System
        let tag: Tag?
        let video: DmcSessionInfoVideo
//        let videoAds: VideoAds
//        let videoLive: JSONNull?
        let viewer: DmcSessionInfoViewer
//        let waku: Waku?

        enum CodingKeys: String, CodingKey {
            case ads = "ads"
            case category = "category"
            case channel = "channel"
            case client = "client"
            case comment = "comment"
//            case community = "community"
            case easyComment = "easyComment"
            case external = "external"
            case genre = "genre"
            case marquee = "marquee"
            case media = "media"
            case okReason = "okReason"
            case owner = "owner"
//            case payment = "payment"
//            case pcWatchPage = "pcWatchPage"
//            case player = "player"
//            case ppv = "ppv"
//            case ranking = "ranking"
//            case series = "series"
//            case smartphone = "smartphone"
//            case system = "system"
            case tag = "tag"
            case video = "video"
//            case videoAds = "videoAds"
//            case videoLive = "videoLive"
            case viewer = "viewer"
//            case waku = "waku"
        }
    }

    // MARK: - Client
    struct Client: Codable {
        let nicosid: String
        let watchID: String
        let watchTrackID: String

        enum CodingKeys: String, CodingKey {
            case nicosid = "nicosid"
            case watchID = "watchId"
            case watchTrackID = "watchTrackId"
        }
    }

    // MARK: - DmcSessionInfoComment
    struct DmcSessionInfoComment: Codable {
        let server: Server
        let keys: Keys
        let layers: [Layer]
        let threads: [Thread]
//        let ng: Ng
        let isAttentionRequired: Bool

        enum CodingKeys: String, CodingKey {
            case server = "server"
            case keys = "keys"
            case layers = "layers"
            case threads = "threads"
//            case ng = "ng"
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

    // MARK: - Ng
    struct Ng: Codable {
        let ngScore: NgScore
        let channel: [JSONAny]
        let owner: [JSONAny]
        let viewer: NgViewer

        enum CodingKeys: String, CodingKey {
            case ngScore = "ngScore"
            case channel = "channel"
            case owner = "owner"
            case viewer = "viewer"
        }
    }

    // MARK: - NgScore
    struct NgScore: Codable {
        let isDisabled: Bool

        enum CodingKeys: String, CodingKey {
            case isDisabled = "isDisabled"
        }
    }

    // MARK: - NgViewer
    struct NgViewer: Codable {
        let revision: Int
        let count: Int
        let items: [Item]

        enum CodingKeys: String, CodingKey {
            case revision = "revision"
            case count = "count"
            case items = "items"
        }
    }

    // MARK: - Item
    struct Item: Codable {
        let type: TypeEnum
        let source: String
        let registeredAt: String?

        enum CodingKeys: String, CodingKey {
            case type = "type"
            case source = "source"
            case registeredAt = "registeredAt"
        }
    }

    enum TypeEnum: String, Codable {
        case id = "id"
        case word = "word"
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
//        let threadkey: JSONNull?
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
//            case threadkey = "threadkey"
            case is184Forced = "is184Forced"
            case hasNicoscript = "hasNicoscript"
            case label = "label"
            case postkeyStatus = "postkeyStatus"
            case server = "server"
        }
    }

    // MARK: - EasyComment
    struct EasyComment: Codable {
        let phrases: [Phrase]

        enum CodingKeys: String, CodingKey {
            case phrases = "phrases"
        }
    }

    // MARK: - Phrase
    struct Phrase: Codable {
        let text: String
        let nicodic: Nicodic?

        enum CodingKeys: String, CodingKey {
            case text = "text"
            case nicodic = "nicodic"
        }
    }

    // MARK: - Nicodic
    struct Nicodic: Codable {
        let title: String
        let viewTitle: String
        let summary: String
        let link: String

        enum CodingKeys: String, CodingKey {
            case title = "title"
            case viewTitle = "viewTitle"
            case summary = "summary"
            case link = "link"
        }
    }

    // MARK: - External
    struct External: Codable {
        let commons: Commons
        let ichiba: Ichiba

        enum CodingKeys: String, CodingKey {
            case commons = "commons"
            case ichiba = "ichiba"
        }
    }

    // MARK: - Commons
    struct Commons: Codable {
        let hasContentTree: Bool

        enum CodingKeys: String, CodingKey {
            case hasContentTree = "hasContentTree"
        }
    }

    // MARK: - Ichiba
    struct Ichiba: Codable {
        let isEnabled: Bool

        enum CodingKeys: String, CodingKey {
            case isEnabled = "isEnabled"
        }
    }

    // MARK: - DmcSessionInfoGenre
    struct DmcSessionInfoGenre: Codable {
        let key: String
        let label: String
        let isImmoral: Bool
        let isDisabled: Bool
        let isNotSet: Bool

        enum CodingKeys: String, CodingKey {
            case key = "key"
            case label = "label"
            case isImmoral = "isImmoral"
            case isDisabled = "isDisabled"
            case isNotSet = "isNotSet"
        }
    }

    // MARK: - Marquee
    struct Marquee: Codable {
        let isDisabled: Bool
        let tagRelatedLead: JSONNull?

        enum CodingKeys: String, CodingKey {
            case isDisabled = "isDisabled"
            case tagRelatedLead = "tagRelatedLead"
        }
    }

    // MARK: - Media
    struct Media: Codable {
        let delivery: Delivery
        let deliveryLegacy: JSONNull?

        enum CodingKeys: String, CodingKey {
            case delivery = "delivery"
            case deliveryLegacy = "deliveryLegacy"
        }
    }

    // MARK: - Delivery
    struct Delivery: Codable {
        let recipeID: String
        let encryption: JSONNull?
        let movie: Movie
        let storyboard: Storyboard?
        let trackingID: String

        enum CodingKeys: String, CodingKey {
            case recipeID = "recipeId"
            case encryption = "encryption"
            case movie = "movie"
            case storyboard = "storyboard"
            case trackingID = "trackingId"
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
        let metadata: AudioMetadata

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case isAvailable = "isAvailable"
            case metadata = "metadata"
        }
    }

    // MARK: - AudioMetadata
    struct AudioMetadata: Codable {
        let bitrate: Int
        let samplingRate: Int
        let loudness: Loudness
        let levelIndex: Int
        let loudnessCollection: [LoudnessCollection]

        enum CodingKeys: String, CodingKey {
            case bitrate = "bitrate"
            case samplingRate = "samplingRate"
            case loudness = "loudness"
            case levelIndex = "levelIndex"
            case loudnessCollection = "loudnessCollection"
        }
    }

    // MARK: - Loudness
    struct Loudness: Codable {
        let integratedLoudness: Double
//        let truePeak: Int

        enum CodingKeys: String, CodingKey {
            case integratedLoudness = "integratedLoudness"
//            case truePeak = "truePeak"
        }
    }

    // MARK: - LoudnessCollection
    struct LoudnessCollection: Codable {
        let type: String
        let value: Double

        enum CodingKeys: String, CodingKey {
            case type = "type"
            case value = "value"
        }
    }

    // MARK: - MovieSession
    struct MovieSession: Codable {
        let recipeID: String
        let playerID: String
        let videos: [String]
        let audios: [String]
        let movies: [JSONAny]
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
            case movies = "movies"
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
        let http: String
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
        let metadata: VideoMetadata

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case isAvailable = "isAvailable"
            case metadata = "metadata"
        }
    }

    // MARK: - VideoMetadata
    struct VideoMetadata: Codable {
        let label: String
        let bitrate: Int
        let resolution: Resolution
        let levelIndex: Int
        let recommendedHighestAudioLevelIndex: Int

        enum CodingKeys: String, CodingKey {
            case label = "label"
            case bitrate = "bitrate"
            case resolution = "resolution"
            case levelIndex = "levelIndex"
            case recommendedHighestAudioLevelIndex = "recommendedHighestAudioLevelIndex"
        }
    }

    // MARK: - Resolution
    struct Resolution: Codable {
        let width: Int
        let height: Int

        enum CodingKeys: String, CodingKey {
            case width = "width"
            case height = "height"
        }
    }

    // MARK: - Storyboard
    struct Storyboard: Codable {
        let contentID: String
        let images: [Image]
        let session: StoryboardSession

        enum CodingKeys: String, CodingKey {
            case contentID = "contentId"
            case images = "images"
            case session = "session"
        }
    }

    // MARK: - Image
    struct Image: Codable {
        let id: String

        enum CodingKeys: String, CodingKey {
            case id = "id"
        }
    }

    // MARK: - StoryboardSession
    struct StoryboardSession: Codable {
        let recipeID: String
        let playerID: String
        let videos: [String]
        let audios: [JSONAny]
        let movies: [JSONAny]
        let protocols: [String]
        let authTypes: FluffyAuthTypes
        let serviceUserID: String
        let token: String
        let signature: String
        let contentID: String
        let heartbeatLifetime: Int
        let contentKeyTimeout: Int
        let priority: Double
        let transferPresets: [JSONAny]
        let urls: [URLElement]

        enum CodingKeys: String, CodingKey {
            case recipeID = "recipeId"
            case playerID = "playerId"
            case videos = "videos"
            case audios = "audios"
            case movies = "movies"
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

    // MARK: - FluffyAuthTypes
    struct FluffyAuthTypes: Codable {
        let storyboard: String

        enum CodingKeys: String, CodingKey {
            case storyboard = "storyboard"
        }
    }

    // MARK: - DmcSessionInfoOwner
    struct DmcSessionInfoOwner: Codable {
        let id: Int
        let nickname: String
        let iconURL: String
//        let channel: JSONNull?
//        let live: JSONNull?
        let isVideosPublic: Bool
        let isMylistsPublic: Bool
        let viewer: OwnerViewer

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case nickname = "nickname"
            case iconURL = "iconUrl"
//            case channel = "channel"
//            case live = "live"
            case isVideosPublic = "isVideosPublic"
            case isMylistsPublic = "isMylistsPublic"
            case viewer = "viewer"
        }
    }

    // MARK: - OwnerViewer
    struct OwnerViewer: Codable {
        let isFollowing: Bool

        enum CodingKeys: String, CodingKey {
            case isFollowing = "isFollowing"
        }
    }

    // MARK: - Payment
    struct Payment: Codable {
        let video: PaymentVideo
        let preview: Preview

        enum CodingKeys: String, CodingKey {
            case video = "video"
            case preview = "preview"
        }
    }

    // MARK: - Preview
    struct Preview: Codable {
        let ppv: Ichiba
        let admission: Ichiba
        let premium: Ichiba

        enum CodingKeys: String, CodingKey {
            case ppv = "ppv"
            case admission = "admission"
            case premium = "premium"
        }
    }

    // MARK: - PaymentVideo
    struct PaymentVideo: Codable {
        let isPpv: Bool
        let isAdmission: Bool
        let isPremium: Bool
        let watchableUserType: String
        let commentableUserType: String

        enum CodingKeys: String, CodingKey {
            case isPpv = "isPpv"
            case isAdmission = "isAdmission"
            case isPremium = "isPremium"
            case watchableUserType = "watchableUserType"
            case commentableUserType = "commentableUserType"
        }
    }

    // MARK: - PCWatchPage
/*
    struct PCWatchPage: Codable {
//        let tagRelatedBanner: JSONNull?
//        let videoEnd: VideoEnd
        let showOwnerMenu: Bool
        let showOwnerThreadCoEditingLink: Bool
        let showMymemoryEditingLink: Bool

        enum CodingKeys: String, CodingKey {
//            case tagRelatedBanner = "tagRelatedBanner"
//            case videoEnd = "videoEnd"
            case showOwnerMenu = "showOwnerMenu"
            case showOwnerThreadCoEditingLink = "showOwnerThreadCoEditingLink"
            case showMymemoryEditingLink = "showMymemoryEditingLink"
        }
    }
*/
 
    // MARK: - Player
    struct Player: Codable {
//        let initialPlayback: JSONNull?
        let comment: PlayerComment
        let layerMode: Int

        enum CodingKeys: String, CodingKey {
//            case initialPlayback = "initialPlayback"
            case comment = "comment"
            case layerMode = "layerMode"
        }
    }

    // MARK: - PlayerComment
    struct PlayerComment: Codable {
        let isDefaultInvisible: Bool

        enum CodingKeys: String, CodingKey {
            case isDefaultInvisible = "isDefaultInvisible"
        }
    }

    // MARK: - Ranking
    struct Ranking: Codable {
        let genre: RankingGenre
        let popularTag: [PopularTag]

        enum CodingKeys: String, CodingKey {
            case genre = "genre"
            case popularTag = "popularTag"
        }
    }

    // MARK: - RankingGenre
    struct RankingGenre: Codable {
        let rank: Int
        let genre: String
        let dateTime: Date

        enum CodingKeys: String, CodingKey {
            case rank = "rank"
            case genre = "genre"
            case dateTime = "dateTime"
        }
    }

    // MARK: - PopularTag
    struct PopularTag: Codable {
        let tag: String
        let regularizedTag: String
        let rank: Int
        let genre: String
        let dateTime: Date

        enum CodingKeys: String, CodingKey {
            case tag = "tag"
            case regularizedTag = "regularizedTag"
            case rank = "rank"
            case genre = "genre"
            case dateTime = "dateTime"
        }
    }

    // MARK: - Series
    struct Series: Codable {
        let id: Int
        let title: String
        let seriesDescription: String
        let thumbnailURL: String
        let video: SeriesVideo

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case title = "title"
            case seriesDescription = "description"
            case thumbnailURL = "thumbnailUrl"
            case video = "video"
        }
    }

    // MARK: - SeriesVideo
    struct SeriesVideo: Codable {
        let prev: First
        let next: First
        let first: First

        enum CodingKeys: String, CodingKey {
            case prev = "prev"
            case next = "next"
            case first = "first"
        }
    }

    // MARK: - First
    struct First: Codable {
        let type: String
        let id: String
        let title: String
        let registeredAt: String?
        let count: Count
        let thumbnail: FirstThumbnail
        let duration: Int
        let shortDescription: String
        let latestCommentSummary: String
        let isChannelVideo: Bool
        let isPaymentRequired: Bool
//        let playbackPosition: JSONNull?
        let owner: FirstOwner
        let requireSensitiveMasking: Bool
        let the9D091F87: Bool
        let acf68865: Bool

        enum CodingKeys: String, CodingKey {
            case type = "type"
            case id = "id"
            case title = "title"
            case registeredAt = "registeredAt"
            case count = "count"
            case thumbnail = "thumbnail"
            case duration = "duration"
            case shortDescription = "shortDescription"
            case latestCommentSummary = "latestCommentSummary"
            case isChannelVideo = "isChannelVideo"
            case isPaymentRequired = "isPaymentRequired"
//            case playbackPosition = "playbackPosition"
            case owner = "owner"
            case requireSensitiveMasking = "requireSensitiveMasking"
            case the9D091F87 = "9d091f87"
            case acf68865 = "acf68865"
        }
    }

    // MARK: - Count
    struct Count: Codable {
        let view: Int
        let comment: Int
        let mylist: Int
        let like: Int

        enum CodingKeys: String, CodingKey {
            case view = "view"
            case comment = "comment"
            case mylist = "mylist"
            case like = "like"
        }
    }

    // MARK: - FirstOwner
    struct FirstOwner: Codable {
        let ownerType: String
        let id: String
        let name: String
        let iconURL: String

        enum CodingKeys: String, CodingKey {
            case ownerType = "ownerType"
            case id = "id"
            case name = "name"
            case iconURL = "iconUrl"
        }
    }

    // MARK: - FirstThumbnail
    struct FirstThumbnail: Codable {
        let url: String?
        let middleURL: String?
        let largeURL: String?
        let listingURL: String?
        let nHDURL: String?

        enum CodingKeys: String, CodingKey {
            case url = "url"
            case middleURL = "middleUrl"
            case largeURL = "largeUrl"
            case listingURL = "listingUrl"
            case nHDURL = "nHdUrl"
        }
    }

    // MARK: - System
    struct System: Codable {
        let serverTime: Date
        let isPeakTime: Bool

        enum CodingKeys: String, CodingKey {
            case serverTime = "serverTime"
            case isPeakTime = "isPeakTime"
        }
    }

    // MARK: - Tag
    struct Tag: Codable {
        let items: [JSONAny]
        let hasR18Tag: Bool
        let isPublishedNicoscript: Bool
        let edit: Edit
        let viewer: Edit

        enum CodingKeys: String, CodingKey {
            case items = "items"
            case hasR18Tag = "hasR18Tag"
            case isPublishedNicoscript = "isPublishedNicoscript"
            case edit = "edit"
            case viewer = "viewer"
        }
    }

    // MARK: - Edit
    struct Edit: Codable {
        let isEditable: Bool
//        let uneditableReason: JSONNull?
        let editKey: String

        enum CodingKeys: String, CodingKey {
            case isEditable = "isEditable"
//            case uneditableReason = "uneditableReason"
            case editKey = "editKey"
        }
    }

    // MARK: - DmcSessionInfoVideo
    struct DmcSessionInfoVideo: Codable {
        let id: String
        let title: String
        let videoDescription: String
        let count: Count
        let duration: Int
        let thumbnail: VideoThumbnail
        let rating: Rating
        let registeredAt: String?
        let isPrivate: Bool
        let isDeleted: Bool
        let isNoBanner: Bool
        let isAuthenticationRequired: Bool
        let isEmbedPlayerAllowed: Bool
        let viewer: VideoViewer
        let watchableUserTypeForPayment: String
        let commentableUserTypeForPayment: String
        let the9D091F87: Bool

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case title = "title"
            case videoDescription = "description"
            case count = "count"
            case duration = "duration"
            case thumbnail = "thumbnail"
            case rating = "rating"
            case registeredAt = "registeredAt"
            case isPrivate = "isPrivate"
            case isDeleted = "isDeleted"
            case isNoBanner = "isNoBanner"
            case isAuthenticationRequired = "isAuthenticationRequired"
            case isEmbedPlayerAllowed = "isEmbedPlayerAllowed"
            case viewer = "viewer"
            case watchableUserTypeForPayment = "watchableUserTypeForPayment"
            case commentableUserTypeForPayment = "commentableUserTypeForPayment"
            case the9D091F87 = "9d091f87"
        }
    }

    // MARK: - Rating
    struct Rating: Codable {
        let isAdult: Bool

        enum CodingKeys: String, CodingKey {
            case isAdult = "isAdult"
        }
    }

    // MARK: - VideoThumbnail
    struct VideoThumbnail: Codable {
        let url: String?
        let middleURL: String?
        let largeURL: String?
        let player: String?
        let ogp: String?

        enum CodingKeys: String, CodingKey {
            case url = "url"
            case middleURL = "middleUrl"
            case largeURL = "largeUrl"
            case player = "player"
            case ogp = "ogp"
        }
    }

    // MARK: - VideoViewer
    struct VideoViewer: Codable {
        let isOwner: Bool
        let like: Like

        enum CodingKeys: String, CodingKey {
            case isOwner = "isOwner"
            case like = "like"
        }
    }

    // MARK: - Like
    struct Like: Codable {
        let isLiked: Bool
//        let count: JSONNull?

        enum CodingKeys: String, CodingKey {
            case isLiked = "isLiked"
//            case count = "count"
        }
    }

    // MARK: - VideoAds
    struct VideoAds: Codable {
        let additionalParams: AdditionalParams
//        let items: [JSONAny]
//        let reason: JSONNull?

        enum CodingKeys: String, CodingKey {
            case additionalParams = "additionalParams"
//            case items = "items"
//            case reason = "reason"
        }
    }

    // MARK: - AdditionalParams
    struct AdditionalParams: Codable {
        let videoID: String
        let videoDuration: Int
        let isAdultRatingNG: Bool
        let isAuthenticationRequired: Bool
        let isR18: Bool
        let nicosid: String
        let lang: String
        let watchTrackID: String
        let genre: String
        let gender: String
        let age: Int

        enum CodingKeys: String, CodingKey {
            case videoID = "videoId"
            case videoDuration = "videoDuration"
            case isAdultRatingNG = "isAdultRatingNG"
            case isAuthenticationRequired = "isAuthenticationRequired"
            case isR18 = "isR18"
            case nicosid = "nicosid"
            case lang = "lang"
            case watchTrackID = "watchTrackId"
            case genre = "genre"
            case gender = "gender"
            case age = "age"
        }
    }

    // MARK: - DmcSessionInfoViewer
    struct DmcSessionInfoViewer: Codable {
        let id: Int
        let nickname: String
        let isPremium: Bool
        let existence: Existence

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case nickname = "nickname"
            case isPremium = "isPremium"
            case existence = "existence"
        }
    }

    // MARK: - Existence
    struct Existence: Codable {
        let age: Int
        let prefecture: String
        let sex: String

        enum CodingKeys: String, CodingKey {
            case age = "age"
            case prefecture = "prefecture"
            case sex = "sex"
        }
    }

    // MARK: - Encode/decode helpers

    class JSONNull: Codable, Hashable {

        public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
        }

        public var hashValue: Int {
            return 0
        }

        public func hash(into hasher: inout Hasher) {
            // No-op
        }

        public init() {}

        public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
        }
    }

    class JSONCodingKey: CodingKey {
        let key: String

        required init?(intValue: Int) {
            return nil
        }

        required init?(stringValue: String) {
            key = stringValue
        }

        var intValue: Int? {
            return nil
        }

        var stringValue: String {
            return key
        }
    }

    class JSONAny: Codable {

        let value: Any

        static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
            let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
            return DecodingError.typeMismatch(JSONAny.self, context)
        }

        static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
            let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
            return EncodingError.invalidValue(value, context)
        }

        static func decode(from container: SingleValueDecodingContainer) throws -> Any {
            if let value = try? container.decode(Bool.self) {
                return value
            }
            if let value = try? container.decode(Int64.self) {
                return value
            }
            if let value = try? container.decode(Double.self) {
                return value
            }
            if let value = try? container.decode(String.self) {
                return value
            }
            if container.decodeNil() {
                return JSONNull()
            }
            throw decodingError(forCodingPath: container.codingPath)
        }

        static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
            if let value = try? container.decode(Bool.self) {
                return value
            }
            if let value = try? container.decode(Int64.self) {
                return value
            }
            if let value = try? container.decode(Double.self) {
                return value
            }
            if let value = try? container.decode(String.self) {
                return value
            }
            if let value = try? container.decodeNil() {
                if value {
                    return JSONNull()
                }
            }
            if var container = try? container.nestedUnkeyedContainer() {
                return try decodeArray(from: &container)
            }
            if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
                return try decodeDictionary(from: &container)
            }
            throw decodingError(forCodingPath: container.codingPath)
        }

        static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
            if let value = try? container.decode(Bool.self, forKey: key) {
                return value
            }
            if let value = try? container.decode(Int64.self, forKey: key) {
                return value
            }
            if let value = try? container.decode(Double.self, forKey: key) {
                return value
            }
            if let value = try? container.decode(String.self, forKey: key) {
                return value
            }
            if let value = try? container.decodeNil(forKey: key) {
                if value {
                    return JSONNull()
                }
            }
            if var container = try? container.nestedUnkeyedContainer(forKey: key) {
                return try decodeArray(from: &container)
            }
            if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
                return try decodeDictionary(from: &container)
            }
            throw decodingError(forCodingPath: container.codingPath)
        }

        static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
            var arr: [Any] = []
            while !container.isAtEnd {
                let value = try decode(from: &container)
                arr.append(value)
            }
            return arr
        }

        static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
            var dict = [String: Any]()
            for key in container.allKeys {
                let value = try decode(from: &container, forKey: key)
                dict[key.stringValue] = value
            }
            return dict
        }

        static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
            for value in array {
                if let value = value as? Bool {
                    try container.encode(value)
                } else if let value = value as? Int64 {
                    try container.encode(value)
                } else if let value = value as? Double {
                    try container.encode(value)
                } else if let value = value as? String {
                    try container.encode(value)
                } else if value is JSONNull {
                    try container.encodeNil()
                } else if let value = value as? [Any] {
                    var container = container.nestedUnkeyedContainer()
                    try encode(to: &container, array: value)
                } else if let value = value as? [String: Any] {
                    var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                    try encode(to: &container, dictionary: value)
                } else {
                    throw encodingError(forValue: value, codingPath: container.codingPath)
                }
            }
        }

        static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
            for (key, value) in dictionary {
                let key = JSONCodingKey(stringValue: key)!
                if let value = value as? Bool {
                    try container.encode(value, forKey: key)
                } else if let value = value as? Int64 {
                    try container.encode(value, forKey: key)
                } else if let value = value as? Double {
                    try container.encode(value, forKey: key)
                } else if let value = value as? String {
                    try container.encode(value, forKey: key)
                } else if value is JSONNull {
                    try container.encodeNil(forKey: key)
                } else if let value = value as? [Any] {
                    var container = container.nestedUnkeyedContainer(forKey: key)
                    try encode(to: &container, array: value)
                } else if let value = value as? [String: Any] {
                    var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                    try encode(to: &container, dictionary: value)
                } else {
                    throw encodingError(forValue: value, codingPath: container.codingPath)
                }
            }
        }

        static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }

        public required init(from decoder: Decoder) throws {
            if var arrayContainer = try? decoder.unkeyedContainer() {
                self.value = try JSONAny.decodeArray(from: &arrayContainer)
            } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
                self.value = try JSONAny.decodeDictionary(from: &container)
            } else {
                let container = try decoder.singleValueContainer()
                self.value = try JSONAny.decode(from: container)
            }
        }

        public func encode(to encoder: Encoder) throws {
            if let arr = self.value as? [Any] {
                var container = encoder.unkeyedContainer()
                try JSONAny.encode(to: &container, array: arr)
            } else if let dict = self.value as? [String: Any] {
                var container = encoder.container(keyedBy: JSONCodingKey.self)
                try JSONAny.encode(to: &container, dictionary: dict)
            } else {
                var container = encoder.singleValueContainer()
                try JSONAny.encode(to: &container, value: self.value)
            }
        }
    }

}
