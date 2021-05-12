//
//  VideoDetailViewModel.swift
//  XML_Sample
//
//  Created by katot on 2021/04/05.
//

import Foundation
import UIKit

final class VideoDetailViewModel: ObservableObject {

    typealias Prop = VideoInfoAPI.Prop

    @Published var prop      : Prop = VideoInfoAPI.defaultProp
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
                self.hasProp = true
                self.prop    = self.detailModel.decodeXml(text)
                
                // Channel video will be supported in the future
                if self.prop.videoId.hasPrefix("sm") {
                    self.showPlay = true
                }
            },
            onError: { error in
                print(error)
            }
        )
    }


    func onOpenWithBrowser() {
        guard let url = URL(string: NicoURL.videoPage(videoId)) else {return}
        UIApplication.shared.open(url, options: [.universalLinksOnly: false], completionHandler: {completed in
            print(completed)
        })
    }

}
