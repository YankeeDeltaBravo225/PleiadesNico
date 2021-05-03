//
//  VideoDetailViewModel.swift
//  XML_Sample
//
//  Created by katot on 2021/04/05.
//

import Foundation
import UIKit

final class VideoDetailViewModel: ObservableObject {

    private    let session     : NicoSession
    private    let detailModel : NicoVideoDetail
    private    let videoId     : String

    @Published var prop     : NicoVideoDetail.Prop
    @Published var hasProp  : Bool
    @Published var showPlay : Bool


    
    init(videoId : String){
        self.session     = NicoSession()
        self.detailModel = NicoVideoDetail( videoId:videoId )
        self.videoId     = videoId
        self.hasProp     = false
        self.showPlay    = false
        self.prop        = NicoVideoDetail.defaultProp
    }


    func loadVideoDetail(videoId : String){
        session.get(
            urlText    : detailModel.url(),
            onReceived : {text in
                self.hasProp = true
                self.prop    = self.detailModel.parseXML(text)
                
                // FLV videos are not supported,
                // Channel video will be supported in the future
                if self.prop.videoId.hasPrefix("sm") && self.prop.fileType == "mp4" {
                    self.showPlay = true
                }
            }
        )
    }


    func onOpenWithBrowser() {
        guard let url = URL(string: NicoStream.staticVideoPageUrl(videoId)) else {return}
        UIApplication.shared.open(url, options: [.universalLinksOnly: false], completionHandler: {completed in
            print(completed)
        })
    }

}
