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
        let runtimeInfo: RuntimeInfo
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
            case runtimeInfo = "runtime_info"
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

    // MARK: - RuntimeInfo
    struct RuntimeInfo: Codable {
        let nodeID: String
        let executionHistory: [JSONAny]
        let thumbnailerState: [JSONAny]

        enum CodingKeys: String, CodingKey {
            case nodeID = "node_id"
            case executionHistory = "execution_history"
            case thumbnailerState = "thumbnailer_state"
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
