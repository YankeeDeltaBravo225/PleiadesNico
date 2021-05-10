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

class DmcSessionResponse {

    // MARK: - DmcSessionInfo
    struct Response: Codable {
        let meta: Meta
        let data: DataClass

        enum CodingKeys: String, CodingKey {
            case meta = "meta"
            case data = "data"
        }
    }

    // MARK: - DataClass
    struct DataClass: Codable {
        let session: Session

        enum CodingKeys: String, CodingKey {
            case session = "session"
        }
    }

    // MARK: - Session
    struct Session: Codable {
        let id: String
        let recipeID: String
        let contentID: String
        let contentSrcIDSets: [ContentSrcIDSet]
        let contentType: String
        let timingConstraint: String
        let keepMethod: KeepMethod
        let sessionProtocol: ProtocolClass
        let playSeekTime: Int
        let playSpeed: Int
        let playControlRange: PlayControlRange
        let contentURI: String
        let sessionOperationAuth: SessionOperationAuth
        let contentAuth: ContentAuth
        let clientInfo: ClientInfo
        let createdTime: Int
        let modifiedTime: Int
        let priority: Double
        let contentRoute: Int
        let version: String
        let contentStatus: String

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case recipeID = "recipe_id"
            case contentID = "content_id"
            case contentSrcIDSets = "content_src_id_sets"
            case contentType = "content_type"
            case timingConstraint = "timing_constraint"
            case keepMethod = "keep_method"
            case sessionProtocol = "protocol"
            case playSeekTime = "play_seek_time"
            case playSpeed = "play_speed"
            case playControlRange = "play_control_range"
            case contentURI = "content_uri"
            case sessionOperationAuth = "session_operation_auth"
            case contentAuth = "content_auth"
            case clientInfo = "client_info"
            case createdTime = "created_time"
            case modifiedTime = "modified_time"
            case priority = "priority"
            case contentRoute = "content_route"
            case version = "version"
            case contentStatus = "content_status"
        }
    }

    // MARK: - ClientInfo
    struct ClientInfo: Codable {
        let playerID: String
        let remoteIP: String
        let trackingInfo: String

        enum CodingKeys: String, CodingKey {
            case playerID = "player_id"
            case remoteIP = "remote_ip"
            case trackingInfo = "tracking_info"
        }
    }

    // MARK: - ContentAuth
    struct ContentAuth: Codable {
        let authType: String
        let maxContentCount: Int
        let contentKeyTimeout: Int
        let serviceID: String
        let serviceUserID: String
        let contentAuthInfo: ContentAuthInfo

        enum CodingKeys: String, CodingKey {
            case authType = "auth_type"
            case maxContentCount = "max_content_count"
            case contentKeyTimeout = "content_key_timeout"
            case serviceID = "service_id"
            case serviceUserID = "service_user_id"
            case contentAuthInfo = "content_auth_info"
        }
    }

    // MARK: - ContentAuthInfo
    struct ContentAuthInfo: Codable {
        let method: String
        let name: String
        let value: String

        enum CodingKeys: String, CodingKey {
            case method = "method"
            case name = "name"
            case value = "value"
        }
    }

    // MARK: - ContentSrcIDSet
    struct ContentSrcIDSet: Codable {
        let contentSrcIDS: [ContentSrcID]
        let allowSubset: String

        enum CodingKeys: String, CodingKey {
            case contentSrcIDS = "content_src_ids"
            case allowSubset = "allow_subset"
        }
    }

    // MARK: - ContentSrcID
    struct ContentSrcID: Codable {
        let srcIDToMux: SrcIDToMux

        enum CodingKeys: String, CodingKey {
            case srcIDToMux = "src_id_to_mux"
        }
    }

    // MARK: - SrcIDToMux
    struct SrcIDToMux: Codable {
        let videoSrcIDS: [String]
        let audioSrcIDS: [String]

        enum CodingKeys: String, CodingKey {
            case videoSrcIDS = "video_src_ids"
            case audioSrcIDS = "audio_src_ids"
        }
    }

    // MARK: - KeepMethod
    struct KeepMethod: Codable {
        let heartbeat: Heartbeat

        enum CodingKeys: String, CodingKey {
            case heartbeat = "heartbeat"
        }
    }

    // MARK: - Heartbeat
    struct Heartbeat: Codable {
        let lifetime: Int
        let onetimeToken: String
        let deletionTimeoutOnNoStream: Int

        enum CodingKeys: String, CodingKey {
            case lifetime = "lifetime"
            case onetimeToken = "onetime_token"
            case deletionTimeoutOnNoStream = "deletion_timeout_on_no_stream"
        }
    }

    // MARK: - PlayControlRange
    struct PlayControlRange: Codable {
        let maxPlaySpeed: Int
        let minPlaySpeed: Int

        enum CodingKeys: String, CodingKey {
            case maxPlaySpeed = "max_play_speed"
            case minPlaySpeed = "min_play_speed"
        }
    }

    // MARK: - SessionOperationAuth
    struct SessionOperationAuth: Codable {
        let sessionOperationAuthBySignature: SessionOperationAuthBySignature

        enum CodingKeys: String, CodingKey {
            case sessionOperationAuthBySignature = "session_operation_auth_by_signature"
        }
    }

    // MARK: - SessionOperationAuthBySignature
    struct SessionOperationAuthBySignature: Codable {
        let createdTime: Int
        let expireTime: Int
        let token: String
        let signature: String

        enum CodingKeys: String, CodingKey {
            case createdTime = "created_time"
            case expireTime = "expire_time"
            case token = "token"
            case signature = "signature"
        }
    }

    // MARK: - ProtocolClass
    struct ProtocolClass: Codable {
        let name: String
        let parameters: ProtocolParameters

        enum CodingKeys: String, CodingKey {
            case name = "name"
            case parameters = "parameters"
        }
    }

    // MARK: - ProtocolParameters
    struct ProtocolParameters: Codable {
        let httpParameters: HTTPParameters

        enum CodingKeys: String, CodingKey {
            case httpParameters = "http_parameters"
        }
    }

    // MARK: - HTTPParameters
    struct HTTPParameters: Codable {
        let method: String
        let parameters: HTTPParametersParameters

        enum CodingKeys: String, CodingKey {
            case method = "method"
            case parameters = "parameters"
        }
    }

    // MARK: - HTTPParametersParameters
    struct HTTPParametersParameters: Codable {
        let hlsParameters: HLSParameters

        enum CodingKeys: String, CodingKey {
            case hlsParameters = "hls_parameters"
        }
    }

    // MARK: - HLSParameters
    struct HLSParameters: Codable {
        let segmentDuration: Int
        let totalDuration: Int
        let transferPreset: String
        let useSSL: String
        let useWellKnownPort: String
        let mediaSegmentFormat: String
        let encryption: Encryption
        let separateAudioStream: String

        enum CodingKeys: String, CodingKey {
            case segmentDuration = "segment_duration"
            case totalDuration = "total_duration"
            case transferPreset = "transfer_preset"
            case useSSL = "use_ssl"
            case useWellKnownPort = "use_well_known_port"
            case mediaSegmentFormat = "media_segment_format"
            case encryption = "encryption"
            case separateAudioStream = "separate_audio_stream"
        }
    }

    // MARK: - Encryption
    struct Encryption: Codable {
        let empty: Empty

        enum CodingKeys: String, CodingKey {
            case empty = "empty"
        }
    }

    // MARK: - Empty
    struct Empty: Codable {
    }

    // MARK: - Meta
    struct Meta: Codable {
        let status: Int
        let message: String

        enum CodingKeys: String, CodingKey {
            case status = "status"
            case message = "message"
        }
    }

}
