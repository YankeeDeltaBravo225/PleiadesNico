//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation

class CommentRequest {
    
    struct Request : Codable {
        var elements : [Element]

        // MARK: - Constructor
        init(_ info : DmcSessionInfo.ApiData){
            var elements : [Element] = []

            elements.append( Element(ping: Ping(content: "rs:0"), thread: nil, threadLeaves: nil) )
//            elements.append( Element(ping: Ping(content: "ps:0"), thread: nil, threadLeaves: nil) )
            
            var count   = 0
            let threads = info.comment.threads.filter{ $0.isActive }

            for thread in threads {

                let minutes = (info.video.duration + 59) / 60
                let content = thread.fork == 0 ? "0-\(minutes):100,1000,nicoru:100" : "0-\(minutes):25,250,nicoru:100"
                
                let threadRoot = Element(
                    ping: nil,
                    thread: CommentThread(
                        thread: String(thread.id),
                        version: "20090904",
                        fork: thread.fork,
                        language: 0,
                        userID: info.media.delivery.movie.session.serviceUserID,
                        withGlobal: 1,
                        scores: 1,
                        nicoru: 3,
                        userkey: info.comment.keys.userKey,
                        content: thread.isLeafRequired ? nil : content
                    ),
                    threadLeaves: nil
                )
                
                var threadElements : [Element]

                if thread.isLeafRequired {
                    let threadLeaf = Element(
                        ping: nil,
                        thread: nil,
                        threadLeaves: CommentThreadLeaf(
                            thread: String(thread.id),
                            fork: thread.fork,
                            language: 0,
                            userID: info.media.delivery.movie.session.serviceUserID,
                            content: content,
                            scores: 1,
                            nicoru: 3,
                            userkey: info.comment.keys.userKey
                        )
                    )
                    threadElements = [threadRoot, threadLeaf]
                } else {
                    threadElements = [threadRoot]
                }

                for threadElement in threadElements {
                    elements.append( Element(ping: Ping(content: "ps:\(count)"), thread: nil, threadLeaves: nil) )
                    elements.append( threadElement )
                    elements.append( Element(ping: Ping(content: "pf:\(count)"), thread: nil, threadLeaves: nil) )
 
                    count += 1
                }
            }

            elements.append( Element(ping: Ping(content: "rf:0"), thread: nil, threadLeaves: nil) )
            
            self.elements = elements
        }

    }
    
    // MARK: - Element
    struct Element: Codable {
        let ping: Ping?
        let thread: CommentThread?
        let threadLeaves: CommentThreadLeaf?

        enum CodingKeys: String, CodingKey {
            case ping = "ping"
            case thread = "thread"
            case threadLeaves = "thread_leaves"
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
    struct CommentThread: Codable {
        let thread: String
        let version: String
        let fork: Int
        let language: Int
        let userID: String
        let withGlobal: Int
        let scores: Int
        let nicoru: Int
        let userkey: String
        let content: String?

        enum CodingKeys: String, CodingKey {
            case thread = "thread"
            case version = "version"
            case fork = "fork"
            case language = "language"
            case userID = "user_id"
            case withGlobal = "with_global"
            case scores = "scores"
            case nicoru = "nicoru"
            case userkey = "userkey"
            case content = "content"
        }
    }

    // MARK: - Thread Leaf
    struct CommentThreadLeaf: Codable {
        let thread: String
        let fork: Int
        let language: Int
        let userID: String
        let content: String
        let scores: Int
        let nicoru: Int
        let userkey: String

        enum CodingKeys: String, CodingKey {
            case thread = "thread"
            case fork = "fork"
            case language = "language"
            case userID = "user_id"
            case content = "content"
            case scores = "scores"
            case nicoru = "nicoru"
            case userkey = "userkey"
        }
    }
    
    typealias Elements = [Element]
}
