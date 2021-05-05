//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation


class StreamConnection {

    typealias OnSuccess = (_ streamUrl : URL) -> Void
    typealias OnError   = (_ reason : String, _ detail : String) -> Void
    
    struct Comment {
        let index : Int
        let sec   : Double
        let body  : String
    }

    enum State: String, CaseIterable {
        case getVideoPage
        case waitVideoPage
        case postDmcReq
        case waitDmcResp
        case postCommentReq
        case waitCommentResp
        case initiateHeartBeat
        case postHeartBeat
        case waitHeartBeat
        case error
    }


    @Published var comments        : [Comment]  = []
    @Published var progress        : String     = ""

    open var onSuccess             : OnSuccess? = nil
    open var onError               : OnError?   = nil
    
    private let session        : NicoSession
    private let stream         : StreamAPI
    
    private var state          : State
    private var heartBeatCount : Int


    init(contentId : String) {
        self.session         = NicoSession()
        self.stream          = StreamAPI(contentId)
        self.state           = .getVideoPage
        self.heartBeatCount  = 0        
    }
    
    
    func advance(){
        switch(state){
        case .getVideoPage:
            startGetVideoPage()
        case .waitVideoPage:
            break
        case .postDmcReq:
            startDmcRequest()
            break
        case .waitDmcResp:
            break
        case .postCommentReq:
            startCommentRequest()
        case .waitCommentResp:
            break
        case .initiateHeartBeat:
            initiateHeartBeat()
        case .postHeartBeat:
            startHeartBeat()
        case .waitHeartBeat:
            break
        case .error:
            break
        }
    }


    func startGetVideoPage(){
        self.progress = "動画ページ受信を開始"

        session.get(
            urlText    : stream.videoPageUrl(),
            onReceived : {text in
                self.onReceiveVideoPage(videoPage: text)
            },
            onError: { error in
                self.handleError(error)
            }
        )
        
        self.state = .waitVideoPage
    }


    func onReceiveVideoPage(videoPage : String){
        self.progress = "動画ページ受信、APIデータ解析中"
        
        guard let dmcApiText = stream.extractDmcApiText( videoPage )
        else {
            handleError("APIデータ抽出に失敗")
            return
        }

        let state = stream.storeDmcSessionInfo( dmcApiText )
        if state != .success {
            handleError("APIデータのパースに失敗")
            DebugLog.shared.error("dmcApiText: \(dmcApiText)")
            return
        }

        self.state = .postCommentReq
    }

    
    func startCommentRequest() {
        guard let commentReq = stream.createCommentReq()
        else {
            handleError("コメント要求の生成に失敗")
            return
        }

        session.post(
            urlText    : stream.commentRequestUrl(),
            data       : commentReq,
            contentType: .textPlain,
            onReceived : {text in
                self.onReceiveCommentResponse(responseText : text)
            },
            onError: { error in
                self.handleError(error)
            }
        )

        self.state   = .waitCommentResp
    }


    func onReceiveCommentResponse(responseText : String){
        self.progress = "コメントを受信"

        DebugLog.shared.debug("< Comments received >")
        DebugLog.shared.debug(responseText)

        let state = stream.storeCommentResponse(responseText)
        if state != .success {
            handleError("コメントのパースに失敗")
            DebugLog.shared.error(responseText)
            return
        }
        
        let vposScale = stream.commentTimeScale()
        self.comments = stream.comments().enumerated().map{
            Comment(
                index: $0.offset,
                sec  : Double($0.element.vpos ?? 0xFFFFFFFF) / vposScale,
                body : $0.element.content ?? ""
            )
        }

        self.state   = .postDmcReq
    }


    func startDmcRequest(){
        self.progress = "DMC API要求を生成中"
        
        guard let dmcReq = stream.createDmcSessionReq()
        else {
            handleError("DMC session requestの生成に失敗")
            return
        }

        session.post(
            urlText    : stream.dmcRequestUrl(),
            data       : dmcReq,
            contentType: .none,
            onReceived : {text in
                self.onReceiveDmcResponse(responseText : text)
            },
            onError: { error in
                self.handleError(error)
            }
        )

        self.state = .waitDmcResp
    }


    func onReceiveDmcResponse(responseText : String){
        self.progress = "DMC API応答を受信"

        let state = stream.storeDmcSessionResponse(responseText )
        if state != .success {
            DebugLog.shared.error("dmcResponse : \(responseText)")
            handleError("DMC API応答のパースに失敗")
            return
        }

        let contentUri = stream.contentUri()
        guard let streamUrl = URL(string: contentUri )
        else {
            handleError("コンテンツURIの取得に失敗")
            return
        }
        
        self.progress = ("再生の準備ができました")
        
        self.onSuccess?(streamUrl)

        self.state = .initiateHeartBeat
    }


    func initiateHeartBeat(){
        DebugLog.shared.debug("[initiateHeartBeat]")
        
        session.option(
            urlText    : stream.heartBeatUrl(),
            onReceived : {text in
                self.onHeartBeatResponse(responseText : text)
            },
            onError: { error in
                self.handleError(error)
            }
        )

        self.state   = .waitHeartBeat
    }
    
    
    func startHeartBeat(){

        self.heartBeatCount += 1
        if self.heartBeatCount < 300{
            return
        }

        DebugLog.shared.debug("[startHeartBeat] count:\(self.heartBeatCount)")
        self.heartBeatCount = 0

        guard let heartBeatReq = stream.createHeartBeatRequest()
        else {
            handleError("Failed to create Heart beat request")
            return
        }

        DebugLog.shared.debug("<heartBeatReq>")
        DebugLog.shared.debug(String(data: heartBeatReq, encoding: .utf8)!)

        session.post(
            urlText    : stream.heartBeatUrl(),
            data       : heartBeatReq,
            contentType: .none,
            onReceived : {text in
                self.onHeartBeatResponse(responseText : text)
            },
            onError: { error in
                self.handleError(error)
            }
        )

        self.state   = .waitHeartBeat
    }


    func onHeartBeatResponse(responseText : String){
        DebugLog.shared.debug("[onHeartBeat response]")
        DebugLog.shared.debug(responseText)

        self.heartBeatCount = 0
        self.state   = .postHeartBeat
    }


    func handleError(_ message : String){
        DebugLog.shared.error(message)
        DebugLog.shared.error(session.errLog)
        self.state = .error
        self.onError?(message, session.errLog)
    }

}
