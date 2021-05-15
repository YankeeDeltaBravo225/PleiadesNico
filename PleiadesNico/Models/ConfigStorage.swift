//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation


class ConfigStorage {
    
    enum PlayerOrientation: Int {
        case portrait           = 0
        case landscapeRight     = 1
        case landscapeLeft      = 2
    }

    static let playerOrientationDescriptions : [String ] = [
        "たて(homeボタン下)",
        "よこ(homeボタン左)",
        "よこ(homeボタン右)"
    ]
    
    enum Key: String {
        case login             = "isLoggedIn"
        case cookie            = "stringCookie"
        case commentFontSize   = "commentFontSize"
        case commentStrokeSize = "commentStrokeSize"
        case playerOrientation = "playerOrientation"
        case controlFadeTime   = "controlFadeTime"
    }
    
    static  let shared       = ConfigStorage()
    private let userDefaults : UserDefaults


    // Creating indivisual instance is prohibited
    private init(){
        let userDefaults = UserDefaults.standard

        userDefaults.register(
            defaults: [
                Key.login.rawValue             : false,
                Key.cookie.rawValue            : "",
                Key.commentFontSize.rawValue   : 20,
                Key.commentStrokeSize.rawValue : 1,
                Key.playerOrientation.rawValue : PlayerOrientation.landscapeLeft.rawValue,
                Key.controlFadeTime.rawValue   : 6,
            ]
        )

        self.userDefaults = userDefaults
    }

    var stringCookie : String? {
        set(stringCookie){
            setOptionalString(stringCookie, key: .cookie)
        }
        get{
            return getString(key: .cookie)
        }
    }

    var loginStatus : Bool {
        set(isLoggedIn){
            setBool(isLoggedIn, key: .login)
        }
        get{
            getBool(key: .login)
        }
    }

    var commentFontSize : Int {
        set(size){
            setInt(size, key: .commentFontSize)
        }
        get{
            getInt(key: .commentFontSize)
        }
    }

    var commentStrokeSize : Int {
        set(size){
            setInt(size, key: .commentStrokeSize)
        }
        get{
            getInt(key: .commentStrokeSize)
        }
    }

    
    var controlFadeTime : Int {
        set(sec){
            setInt(sec, key: .controlFadeTime)
        }
        get{
            getInt(key: .controlFadeTime)
        }
    }


    var playerOrientation : Int {
        set(orientation){
            setInt(orientation, key: .playerOrientation)
        }
        get{
            getInt(key: .playerOrientation)
        }
    }
    

    private func setOptionalString(_ value : String?, key : Key){
        self.userDefaults.set(value, forKey: key.rawValue)
        self.userDefaults.synchronize()
    }

    private func setString(_ value : String, key : Key){
        self.userDefaults.set(value, forKey: key.rawValue)
        self.userDefaults.synchronize()
    }
    
    private func setInt(_ value : Int, key : Key){
        self.userDefaults.set(value, forKey: key.rawValue)
        self.userDefaults.synchronize()
    }
    
    private func setBool(_ value : Bool, key : Key){
        self.userDefaults.set(value, forKey: key.rawValue)
        self.userDefaults.synchronize()
    }
    

    private func getString(key : Key) -> String? {
        return self.userDefaults.string(forKey: key.rawValue)
    }
    
    private func getInt(key : Key) -> Int {
        return self.userDefaults.integer(forKey: key.rawValue)
    }
    
    private func getBool(key : Key) -> Bool {
        return self.userDefaults.bool(forKey: key.rawValue)
    }

}
