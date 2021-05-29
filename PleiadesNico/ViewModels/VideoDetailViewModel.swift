//
//  VideoDetailViewModel.swift
//  XML_Sample
//
//  Created by katot on 2021/04/05.
//

import Foundation
import UIKit

final class VideoDetailViewModel: ObservableObject {

    typealias Attr = CommonType.VideoAttribute
    typealias Prop = VideoInfoAPI.Prop

    @Published var prop      : Prop = VideoInfoAPI.defaultProp
    @Published var attr      : Attr = CommonType.VideoAttribute(
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
    @Published var hasProp   : Bool = false
    @Published var showPlay  : Bool = false
    @Published var didAppear : Bool = false

    private    let session     : NicoSession
    private    let detailModel : VideoInfoAPI
    private    let videoId     : String
    private    var appearCount : Int


    init(videoId : String){
        self.session     = NicoSession()
        self.detailModel = VideoInfoAPI( videoId:videoId )
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
            urlText    : detailModel.url(),
            onReceived : {text in
                self.onReceivedVideoDetail(text)
            },
            onError: { error in
                print(error)
            }
        )
    }


    func onReceivedVideoDetail(_ xmlText : String){
        self.hasProp = true
        self.prop    = self.detailModel.decodeXml(xmlText)
        self.attr    = CommonType.VideoAttribute(
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

        // Channel video will be supported in the future
        if self.videoId.hasPrefix("sm") {
            self.showPlay = true
        }
    }
    
    
    
    func onOpenWithBrowser() {
        guard let url = URL(string: NicoURL.videoPage(videoId)) else {return}
        UIApplication.shared.open(url, options: [.universalLinksOnly: false], completionHandler: {completed in
            print(completed)
        })
    }

}
