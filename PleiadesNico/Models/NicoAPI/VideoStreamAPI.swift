//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation
import Kanna

//
// There is no official specification for Niconico's streaming
// However, crolling is not prohibited by its officials
//


class VideoStreamAPI {

    public var errorLog     : String = ""

    private let contentId   : String
    private var dmcApiInfo  : DmcSessionInfo.ApiData?
    private var dmcResponse : DmcSessionResponse.Response?
    private var chats       : [CommentResponse.Chat]

    enum State: String, CaseIterable {
        case success
        case error
    }
    
    
    init(_ contentId : String){
        self.contentId = contentId
        
        self.dmcApiInfo  = nil
        self.dmcResponse = nil
        self.chats    = []
    }


    func videoPageUrl() -> String{
        return NicoURL.videoPage( self.contentId )
    }


    func heartBeatUrl() -> String{
        let sessionId = self.dmcResponse?.data.session.id ?? ""
        return NicoURL.heartBeat(sessionId)
    }

    
    func dmcRequestUrl() -> String {
        return NicoURL.dmcRequest()
    }
    

    func commentRequestUrl() -> String {
        return NicoURL.commentRequest()
    }
    
    
    func contentUri() -> String {
        return dmcResponse?.data.session.contentURI ?? ""
    }


    func extractDmcApiText(_ htmlText : String) -> String?{
        guard let doc = try? Kanna.HTML(html: htmlText, encoding: .utf8)
        else{
            registerError("Failed to parse HTML!")
            return nil
        }

        let xpath = #"//div/@data-api-data"#

        guard let apiDataText : String = doc.xpath( xpath ).first?.text
        else {
            registerError("data-api-data not found")
            return nil
        }

        return apiDataText
    }


    func storeDmcSessionInfo(_ dmcInfoText : String) -> State{
        let json : NicoJson = NicoJson(dmcInfoText)

        var info : DmcSessionInfo.ApiData
        do{
            info = try json.decode(DmcSessionInfo.ApiData.self)
        } catch{
            registerError("error: \(error.localizedDescription)")
            return .error
        }

        self.dmcApiInfo = info
        return .success
    }


    func createDmcSessionReq() -> Data?{

        guard let dmcInfo = self.dmcApiInfo
        else {
            registerError("DMC API info does not exist")
            return nil
        }

        let dmcReq = DmcSessionRequest.Request( dmcInfo )
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        guard let jsonReq = try? encoder.encode(dmcReq) else {
            registerError("Failed to encode to JSON.")
            return nil
        }

        DebugLog.shared.debug("---- DMC Request ----")
        DebugLog.shared.debug(String(data: jsonReq, encoding: .utf8)!)
        DebugLog.shared.debug("---------------------")

        return jsonReq
    }
    

    func storeDmcSessionResponse(_ responseText : String) -> State {
        let json : NicoJson = NicoJson(responseText)

        var resp : DmcSessionResponse.Response
        do{
            resp = try json.decode(DmcSessionResponse.Response.self)
        } catch{
            registerError("error: \(error.localizedDescription)")
            return .error
        }

        self.dmcResponse = resp
        return .success
    }

    
    func createHeartBeatRequest() -> Data?{

        guard let dmcData = self.dmcResponse?.data
        else {
            registerError("DMC Response Data is Invalid.")
            return nil
        }
        
        let encoder = JSONEncoder()
        guard let jsonReq = try? encoder.encode(dmcData) else {
            registerError("Failed to encode to Heart Beat request.")
            return nil
        }

        return jsonReq
    }


    func createCommentReq() -> Data?{

        guard let dmcInfo = self.dmcApiInfo
        else {
            registerError("DMC API info does not exist")
            return nil
        }

        let commentReq = CommentRequest.Request( dmcInfo )
        let encoder = JSONEncoder()
//        encoder.outputFormatting = .prettyregisterErrored

        guard let jsonReq = try? encoder.encode(commentReq.elements) else {
            registerError("Failed to encode Comment Request to JSON.")
            return nil
        }
        
        DebugLog.shared.debug(String(data: jsonReq, encoding: .utf8)!)

        return jsonReq
    }


    func storeCommentResponse(_ commentText : String) -> State{
        let json : NicoJson = NicoJson("{ \"elements\": \(commentText) }")

        var resp : CommentResponse.Response
        do{
            resp = try json.decode(CommentResponse.Response.self)
        } catch{
            registerError("error: \(error.localizedDescription)")
            return .error
        }

        let chats = resp.elements.map{ $0.chat }.filter{ $0?.content != nil }.compactMap{ $0 }

        self.chats = chats.sorted(
            by: { (a, b) -> Bool in
                return (a.vpos ?? 0xFFFFFFFE) < (b.vpos ?? 0xFFFFFFFF)
            }
        )

        return .success
    }


    func comments() -> [CommentResponse.Chat] {
        return self.chats
    }


    func commentTimeScale() -> Double {
        return 100.0
    }


    func registerError(_ description : String){
        DebugLog.shared.error(description)
        self.errorLog += "\n" + description
    }

    
    func isPremium() -> Bool?{
        return self.dmcApiInfo?.viewer?.isPremium
    }
    
}
