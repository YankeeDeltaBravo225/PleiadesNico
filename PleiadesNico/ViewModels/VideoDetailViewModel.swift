//
//  VideoDetailViewModel.swift
//  XML_Sample
//
//  Created by katot on 2021/04/05.
//

import Foundation

final class VideoDetailViewModel: ObservableObject {

    @Published var prop    : NicoVideoDetail.Prop
    @Published var hasProp : Bool

    private let session  = NicoSession()
    
    init(){
        hasProp = false
        prop    = NicoVideoDetail.defaultProp
    }


    func loadVideoDetail(videoId : String){
        session.get(
            urlText    : NicoVideoDetail.url(videoId : videoId),
            onReceived : {text in
                self.hasProp = true
                self.prop    = NicoVideoDetail.loadXML(text)
            }
        )
    }

}
