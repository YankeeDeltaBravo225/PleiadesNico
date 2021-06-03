//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation

final class MylistGroupViewModel: ObservableObject {
    
    struct Mylist{
        let id   : String
        let name : String
    }


    @Published var mylists    : [Mylist] = []
    @Published var isLoggedIn : Bool     = ConfigStorage.shared.loginStatus

    private var didAppear  : Bool
    private var groupApi   : MylistGroupAPI
    private let session    : NicoSession
    

    init(){
        self.didAppear = false
        self.groupApi  = MylistGroupAPI()
        self.session   = NicoSession()
    }


    func onAppearMylistGroup(){
        let newIsLoggedIn  = ConfigStorage.shared.loginStatus
        let isLoginUpdated = newIsLoggedIn != self.isLoggedIn
        
        if !self.didAppear || isLoginUpdated {
            fetchMylistGroup()
        }

        self.isLoggedIn = newIsLoggedIn
        self.didAppear  = true
    }
    
    
    func fetchMylistGroup(){
        self.mylists = []
        
        self.session.get(
            urlText    : groupApi.url(),
            onReceived : {text in
                self.onReceivedGroup(text)
            },
            onError: { error in
                self.handleError(error)
            }
        )
    }


    func onReceivedGroup(_ rawText : String){
        var group : MylistGroupAPI.MylistGroup
        do{
            group = try groupApi.decode( rawText )
        } catch{
            handleError("error: \(error.localizedDescription)")
            return
        }

        self.mylists = group.mylistgroup.map{ Mylist(id: $0.id, name: $0.name) }
    }


    func handleError(_ error : String){
        DebugLog.shared.error( error )
    }

}
