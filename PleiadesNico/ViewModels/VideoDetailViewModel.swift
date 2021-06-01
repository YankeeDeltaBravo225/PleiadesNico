//
//  VideoDetailViewModel.swift
//  XML_Sample
//
//  Created by katot on 2021/04/05.
//

import Foundation
import UIKit

final class VideoDetailViewModel: ObservableObject {

    typealias Attr = CommonData.VideoAttribute
    typealias Prop = VideoInfoAPI.Prop

    @Published var prop      : Prop = VideoInfoAPI.defaultProp
    @Published var attr      : Attr = CommonData.VideoAttribute(
        number    : 0,
        contentId : "????",
        title     : "no title",
        thumbnail : "",
        uploaded  : "no date",
        duration  : "?:?",
        views     : "?",
        comments  : "?",
        mylists   : "?"
    )
    @Published var hasProp        : Bool   = false
    @Published var showPlay       : Bool   = false
    @Published var cantPlayReason : String = ""
    @Published var didAppear      : Bool   = false
    @Published var dmcDescription : String = "No description"
    
    private    let session     : NicoSession
    private    let infoApi     : VideoInfoAPI  // todo: Retrieve all info from stream API
    private    let streamApi   : VideoStreamAPI
    private    let videoId     : String
    private    var appearCount : Int


    init(videoId : String){
        self.session     = NicoSession()
        self.infoApi     = VideoInfoAPI( videoId:videoId )
        self.streamApi   = VideoStreamAPI(videoId)
        self.videoId     = videoId
        self.appearCount = 0
    }


    func onAppearVideoDetail(){
        self.didAppear = true
        
        if self.appearCount > 0 {
            return
        }

        self.appearCount += 1

        loadVideoDetail()
    }


    func loadVideoDetail(){
        session.get(
            urlText    : infoApi.url(),
            onReceived : {text in
                self.onReceivedVideoDetail(text)
            },
            onError: { error in
                self.handleError(error)
            }
        )
    }


    func onReceivedVideoDetail(_ xmlText : String){
        guard let prop = self.infoApi.decodeXml(xmlText)
        else {
            handleError("XMLデータのパースに失敗")
            return
        }
        
        self.prop    = prop
        self.hasProp = true
        self.attr    = CommonData.VideoAttribute(
            number        : 0,
            contentId     : self.videoId,
            title         : self.prop.title,
            thumbnail     : self.prop.thumbnail,
            uploaded      : TextFormat.shared.dateFromISO8601(self.prop.uploaded),
            duration      : self.prop.duration,
            views         : self.prop.views,
            comments      : self.prop.comments,
            mylists       : self.prop.mylists
        )
        
        // Retrieve more detail from stream API
        session.get(
            urlText    : streamApi.videoPageUrl(),
            onReceived : {text in
                self.onReceiveVideoPage(videoPage: text)
            },
            onError: { error in
                self.handleError(error)
            }
        )
    }


    func onReceiveVideoPage(videoPage : String){
        guard let dmcApiText = streamApi.extractDmcApiText( videoPage )
        else {
            handleError("APIデータ抽出に失敗")
            return
        }

        let state = streamApi.storeDmcSessionInfo( dmcApiText )
        if state != .success {
            handleError("APIデータのパースに失敗")
            DebugLog.shared.error("dmcApiText: \(dmcApiText)")
            return
        }
        
        self.dmcDescription = streamApi.videoDescription()

        // Channel video will be supported in the future
        if self.videoId.hasPrefix("sm") {
            self.showPlay = true
        } else {
            if self.videoId.hasPrefix("so") {
                self.cantPlayReason = "チャンネル動画は未サポートです"
            } else {
                self.cantPlayReason = "非サポートの動画形式です"
            }
        }
    }


    func handleError(_ error : String){
        DebugLog.shared.error( error )
        self.showPlay       = false
        self.cantPlayReason = "再生情報の取得に失敗しました"
    }


    func onOpenWithBrowser() {
        guard let url = URL(string: streamApi.videoPageUrl()) else {return}
        UIApplication.shared.open(url, options: [.universalLinksOnly: false], completionHandler: {completed in
            print(completed)
        })
    }

}
