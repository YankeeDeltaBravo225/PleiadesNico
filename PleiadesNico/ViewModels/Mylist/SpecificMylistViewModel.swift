//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation

final class SpecificMylistViewModel: ObservableObject {

    @Published var videos : [CommonData.VideoAttribute] = []
    
    private var didAppear  : Bool
    private var mylistApi  : SpecificMylistAPI
    private let session    : NicoSession


    init(listId : String){
        self.didAppear = false
        self.mylistApi = SpecificMylistAPI( listId )
        self.session   = NicoSession()
    }


    func onAppearSpecificMylist(){
        if !self.didAppear {
            fetchMylist()
        }

        self.didAppear = true
    }

    
    func fetchMylist(){
        self.session.get(
            urlText    : mylistApi.url(),
            onReceived : {text in
                self.onReceivedMylist(text)
            },
            onError: { error in
                self.handleError(error)
            }
        )
    }

    
    func onReceivedMylist(_ rawText : String){
        var mylist : SpecificMylistAPI.Mylist
        do{
            mylist = try mylistApi.decode( rawText )
        } catch{
            handleError("error: \(error.localizedDescription)")
            return
        }

        let items = mylist.mylistitem.reversed().map{$0}
        
        self.videos = items.indices.map{ index in
            CommonData.VideoAttribute(
                number        : index,
                contentId     : items[index].itemData.videoID,
                title         : TextFormat.shared.htmlEntityDecoded( items[index].itemData.title ),
                thumbnail     : items[index].itemData.thumbnailURL,
                uploaded      : TextFormat.shared.dateFromUnixTime( items[index].itemData.firstRetrieve ),
                duration      : TextFormat.shared.duration( Int(items[index].itemData.lengthSeconds) ?? 0 ),
                views         : items[index].itemData.viewCounter,
                comments      : items[index].itemData.numRes,
                mylists       : items[index].itemData.mylistCounter
            )
        }
    }


    func handleError(_ error : String){
        DebugLog.shared.error( error )
    }

}
