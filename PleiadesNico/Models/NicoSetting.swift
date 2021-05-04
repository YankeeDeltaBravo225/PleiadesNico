//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation


class NicoSetting {
    
    enum Key: String {
        case login           = "isLoggedIn"
        case cookie          = "stringCookie"
        case commentSize     = "commentFontSize"
        case controlFadeTime = "controlFadeTime"
    }
    
    static  let shared       = NicoSetting()
    private let userDefaults : UserDefaults


    // Creating indivisual instance is prohibited
    private init(){
        let userDefaults = UserDefaults.standard

        userDefaults.register(
            defaults: [
                Key.login.rawValue           : false,
                Key.cookie.rawValue          : "",
                Key.commentSize.rawValue     : 20,
                Key.controlFadeTime.rawValue : 6,
            ]
        )

        self.userDefaults = userDefaults
    }

    var stringCookie : String? {
        set(stringCookie){
            self.userDefaults.set(stringCookie,forKey: Key.cookie.rawValue)
            self.userDefaults.synchronize()
        }
        get{
            return self.userDefaults.string(forKey: Key.cookie.rawValue)
        }
    }

    var loginStatus : Bool {
        set(isLoggedIn){
            self.userDefaults.set(isLoggedIn,forKey: Key.login.rawValue)
            self.userDefaults.synchronize()
        }
        get{
            return self.userDefaults.bool(forKey: Key.login.rawValue)
        }
    }

    var commentFontSize : Int {
        set(size){
            self.userDefaults.set(size,forKey: Key.commentSize.rawValue)
            self.userDefaults.synchronize()
        }
        get{
            self.userDefaults.integer(forKey: Key.commentSize.rawValue)
        }
    }

    var controlFadeTime : Int {
        set(sec){
            self.userDefaults.set(sec,forKey: Key.controlFadeTime.rawValue)
            self.userDefaults.synchronize()
        }
        get{
            self.userDefaults.integer(forKey: Key.controlFadeTime.rawValue)
        }
    }
    
}
