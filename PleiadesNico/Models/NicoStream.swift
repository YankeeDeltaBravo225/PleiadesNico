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


class NicoStream {
    
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


    static func staticVideoPageUrl(_ videoId : String) -> String {
        return "https://www.nicovideo.jp/watch/" + videoId
    }


    func videoPageUrl() -> String{
        return NicoStream.staticVideoPageUrl( self.contentId )
    }


    func heartBeatUrl() -> String{
        let sessionId = self.dmcResponse?.data.session.id ?? ""
        return "https://api.dmc.nico/api/sessions/\(sessionId)?_format=json&_method=PUT"
    }


    func dmcRequestUrl() -> String {
        return "https://api.dmc.nico/api/sessions?_format=json"
    }
    

    func commentRequestUrl() -> String {
        return "https://nmsg.nicovideo.jp/api.json"
    }

    
    func contentUri() -> String {
        return dmcResponse?.data.session.contentURI ?? ""
    }


    func extractDmcApiText(_ htmlText : String) -> String?{
        guard let doc = try? Kanna.HTML(html: htmlText, encoding: .utf8)
        else{
            DebugLog.shared.error("Failed to parse HTML!")
            return nil
        }

        let xpath = #"//div/@data-api-data"#

        guard let apiDataText : String = doc.xpath( xpath ).first?.text
        else {
            DebugLog.shared.error("data-api-data not found")
            return nil
        }

        return apiDataText
    }


    func storeDmcSessionInfo(_ dmcInfoText : String) -> State{
        
        let data     = dmcInfoText.data(using: .utf8)
        let decorder = JSONDecoder()
        let dmcInfo  : DmcSessionInfo.ApiData

        do {
            dmcInfo = try decorder.decode(DmcSessionInfo.ApiData.self, from: data!)
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
            return .error
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return .error
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return .error
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return .error
        } catch {
            print("error: ", error)
            return .error
        }

        self.dmcApiInfo = dmcInfo
        
        return .success
    }


    func createDmcSessionReq() -> Data?{

        guard let dmcInfo = self.dmcApiInfo
        else {
            DebugLog.shared.error("DMC API info does not exist")
            return nil
        }

        let dmcReq = DmcSessionRequest.Request( dmcInfo )
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        guard let jsonReq = try? encoder.encode(dmcReq) else {
            DebugLog.shared.error("Failed to encode to JSON.")
            return nil
        }

        DebugLog.shared.debug("---- DMC Request ----")
        DebugLog.shared.debug(String(data: jsonReq, encoding: .utf8)!)
        DebugLog.shared.debug("---------------------")

        return jsonReq
    }
    

    func storeDmcSessionResponse(_ responseText : String) -> State {
        
        let data       = responseText.data(using: .utf8)
        let decorder   = JSONDecoder()
        let dmcResponse : DmcSessionResponse.Response

        do {
            dmcResponse = try decorder.decode(DmcSessionResponse.Response.self, from: data!)
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
            return .error
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return .error
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return .error
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return .error
        } catch {
            print("error: ", error)
            return .error
        }

        self.dmcResponse = dmcResponse

        return .success
    }

    
    func createHeartBeatRequest() -> Data?{

        guard let dmcData = self.dmcResponse?.data
        else {
            DebugLog.shared.error("DMC Response Data is Invalid.")
            return nil
        }
        
        let encoder = JSONEncoder()
        guard let jsonReq = try? encoder.encode(dmcData) else {
            DebugLog.shared.error("Failed to encode to Heart Beat request.")
            return nil
        }

        return jsonReq
    }


    func createCommentReq() -> Data?{

        guard let dmcInfo = self.dmcApiInfo
        else {
            DebugLog.shared.error("DMC API info does not exist")
            return nil
        }

        let commentReq = CommentRequest.Request( dmcInfo )
        let encoder = JSONEncoder()
//        encoder.outputFormatting = .prettyPrinted

        guard let jsonReq = try? encoder.encode(commentReq.elements) else {
            DebugLog.shared.error("Failed to encode Comment Request to JSON.")
            return nil
        }
        
        DebugLog.shared.debug(String(data: jsonReq, encoding: .utf8)!)

        return jsonReq
    }


    func storeCommentResponse(_ commentText : String) -> State{
        
        let converted = "{ \"elements\": \(commentText) }"
        let data      = converted.data(using: .utf8)
        let decorder  = JSONDecoder()
        let response  : CommentResponse.Response

        do {
            response = try decorder.decode(CommentResponse.Response.self, from: data!)
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
            return .error
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return .error
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return .error
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return .error
        } catch {
            print("error: ", error)
            return .error
        }

        let chats = response.elements.map{ $0.chat }.filter{ $0?.content != nil }.compactMap{ $0 }

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

}
