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
            
            let isChannel : Bool = info.channel != nil
            
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
                        force184: thread.is184Forced ? "1" : nil,
                        withGlobal: 1,
                        scores: 1,
                        nicoru: 3,
                        content: thread.isLeafRequired ? nil : content,
                        userkey: info.comment.keys.userKey,
                        threadkey: thread.isThreadkeyRequired ? thread.threadkey : nil
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
                            force184: thread.is184Forced ? "1" : nil,
                            userkey: !isChannel ? info.comment.keys.userKey : nil,
                            threadkey: isChannel ? thread.threadkey : nil
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
        let force184: String?
        let withGlobal: Int
        let scores: Int
        let nicoru: Int
        let content: String?
        let userkey: String?
        let threadkey: String?
        enum CodingKeys: String, CodingKey {
            case thread = "thread"
            case version = "version"
            case fork = "fork"
            case language = "language"
            case userID = "user_id"
            case force184 = "force_184"
            case withGlobal = "with_global"
            case scores = "scores"
            case nicoru = "nicoru"
            case content = "content"
            case userkey = "userkey"
            case threadkey = "threadkey"
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
        let force184: String?
        let userkey: String?
        let threadkey: String?

        enum CodingKeys: String, CodingKey {
            case thread = "thread"
            case fork = "fork"
            case language = "language"
            case userID = "user_id"
            case content = "content"
            case scores = "scores"
            case nicoru = "nicoru"
            case force184 = "force_184"
            case userkey = "userkey"
            case threadkey = "threadkey"
        }
    }
    
    typealias Elements = [Element]
}
