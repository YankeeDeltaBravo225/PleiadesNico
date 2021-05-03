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


class DmcSessionRequest {

    // MARK: - DmcSessionInfo
    struct Request: Codable {
        let session: Session

        enum CodingKeys: String, CodingKey {
            case session = "session"
        }

        init(_ info : DmcSessionInfo.ApiData){
            session = Session(info);
        }
    }

    // MARK: - Session
    struct Session: Codable {
        let recipeID: String
        let contentID: String
        let contentType: String
        let contentSrcIDSets: [ContentSrcIDSet]
        let timingConstraint: String
        let keepMethod: KeepMethod
        let sessionProtocol: ProtocolClass
        let contentURI: String
        let sessionOperationAuth: SessionOperationAuth
        let contentAuth: ContentAuth
        let clientInfo: ClientInfo
        let priority: Double

        enum CodingKeys: String, CodingKey {
            case recipeID = "recipe_id"
            case contentID = "content_id"
            case contentType = "content_type"
            case contentSrcIDSets = "content_src_id_sets"
            case timingConstraint = "timing_constraint"
            case keepMethod = "keep_method"
            case sessionProtocol = "protocol"
            case contentURI = "content_uri"
            case sessionOperationAuth = "session_operation_auth"
            case contentAuth = "content_auth"
            case clientInfo = "client_info"
            case priority = "priority"
        }

        // MARK: - Constructor
        init(_ info : DmcSessionInfo.ApiData){
            let movie   = info.media.delivery.movie
            let session = info.media.delivery.movie.session
            let isPremium = info.viewer?.isPremium ?? false
            
            let audios = movie.audios.map{ $0.id }
            let audio  = isPremium ? audios.first! : audios.last!

            var videos = movie.videos.map{ $0.id }
            if !isPremium && videos.count > 2 {
                videos = videos.dropFirst( videos.count - 2 ).map{ $0 }
            }
            
            let srcIds = videos.indices.map{
                ContentSrcID(
                    srcIDToMux: SrcIDToMux(
                        videoSrcIDS: videos[$0..<videos.count].map{ $0 },
                        audioSrcIDS: [audio]
                    )
                )
            }
            
            let transferPreset = session.transferPresets.count > 0 ? session.transferPresets[0] : ""
            
            recipeID = session.recipeID
            contentID   = movie.contentID
            contentType =  "movie"
 
            contentSrcIDSets = [
                ContentSrcIDSet(
                    contentSrcIDS: srcIds
                )
            ]

            timingConstraint = "unlimited"
            keepMethod = KeepMethod(
                heartbeat: Heartbeat(
                    lifetime: session.heartbeatLifetime
                )
            )
            sessionProtocol = ProtocolClass(
                name: session.protocols[0],
                parameters: ProtocolParameters(
                    httpParameters: HTTPParameters(
                        parameters: HTTPParametersParameters(
                            hlsParameters: HLSParameters (
                                useWellKnownPort : session.urls[0].isWellKnownPort ? "yes" : "no",
                                useSSL           : session.urls[0].isSSL           ? "yes" : "no",
                                transferPreset   : transferPreset,
                                segmentDuration  : 6000
                            )
                        )
                    )
                )
            )
            contentURI = ""
            sessionOperationAuth = SessionOperationAuth(
                sessionOperationAuthBySignature: SessionOperationAuthBySignature(
                    token     : session.token,
                    signature : session.signature
                )
            )
            contentAuth = ContentAuth(
                authType          : session.authTypes.http,
                contentKeyTimeout : session.contentKeyTimeout,
                serviceID         : "nicovideo",
                serviceUserID     : session.serviceUserID
            )
            clientInfo = ClientInfo(
                playerID: session.playerID
            )
            priority = session.priority
        }

    }

    // MARK: - ClientInfo
    struct ClientInfo: Codable {
        let playerID: String

        enum CodingKeys: String, CodingKey {
            case playerID = "player_id"
        }
    }

    // MARK: - ContentAuth
    struct ContentAuth: Codable {
        let authType: String
        let contentKeyTimeout: Int
        let serviceID: String
        let serviceUserID: String

        enum CodingKeys: String, CodingKey {
            case authType = "auth_type"
            case contentKeyTimeout = "content_key_timeout"
            case serviceID = "service_id"
            case serviceUserID = "service_user_id"
        }
    }

    // MARK: - ContentSrcIDSet
    struct ContentSrcIDSet: Codable {
        let contentSrcIDS: [ContentSrcID]

        enum CodingKeys: String, CodingKey {
            case contentSrcIDS = "content_src_ids"
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

        enum CodingKeys: String, CodingKey {
            case lifetime = "lifetime"
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
        let token: String
        let signature: String

        enum CodingKeys: String, CodingKey {
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
        let parameters: HTTPParametersParameters

        enum CodingKeys: String, CodingKey {
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
        let useWellKnownPort: String
        let useSSL: String
        let transferPreset: String
        let segmentDuration: Int

        enum CodingKeys: String, CodingKey {
            case useWellKnownPort = "use_well_known_port"
            case useSSL = "use_ssl"
            case transferPreset = "transfer_preset"
            case segmentDuration = "segment_duration"
        }
    }

}
