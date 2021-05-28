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

    enum GestureType: Int, CaseIterable {
        case swipeLeft          = 0
        case swipeRight         = 1
        case swipeUp            = 2
        case swipeDown          = 3
        
        static let allValues : [GestureType] = [.swipeLeft, .swipeRight, .swipeUp, .swipeDown]
    }
    
    static let gestureTypeKeyMap : [Int : Key] = [
        GestureType.swipeLeft.rawValue  : .leftSwipeGesture,
        GestureType.swipeRight.rawValue : .rightSwipeGesture,
        GestureType.swipeUp.rawValue    : .upSwipeGesture,
        GestureType.swipeDown.rawValue  : .downSwipeGesture
    ]
    
    enum GestureOperation: Int, CaseIterable {
        case none               = 0
        case close              = 1
        case plus10Sec          = 2
        case minus10Sec         = 3
    }

    enum Key: String {
        case login                = "isLoggedIn"
        case cookie               = "stringCookie"
        case commentFontSize      = "commentFontSize"
        case commentStrokeSize    = "commentStrokeSize"
        case playerOrientation    = "playerOrientation"
        case leftSwipeGesture     = "leftSwipeGesture"
        case rightSwipeGesture    = "rightSwipeGesture"
        case upSwipeGesture       = "upSwipeGesture"
        case downSwipeGesture     = "downSwipeGesture"
        case swipeThreshold       = "swipeThreshold"
        case controlFadeTime      = "controlFadeTime"
        case rankingGenre         = "rankingGenre"
        case rankingTerm          = "rankingTerm"
        case searchKind           = "searchKind"
        case searchOrderKey       = "searchOrderKey"
        case searchOrderDirection = "searchOrderDirection"
    }

    // Creating indivisual instance is prohibited
    private init(){
        let userDefaults = UserDefaults.standard

        userDefaults.register(
            defaults: [
                Key.login.rawValue                : false,
                Key.cookie.rawValue               : "",
                Key.commentFontSize.rawValue      : 20,
                Key.commentStrokeSize.rawValue    : 1,
                Key.playerOrientation.rawValue    : PlayerOrientation.landscapeLeft.rawValue,
                Key.leftSwipeGesture.rawValue     : GestureOperation.none.rawValue,
                Key.rightSwipeGesture.rawValue    : GestureOperation.none.rawValue,
                Key.upSwipeGesture.rawValue       : GestureOperation.none.rawValue,
                Key.downSwipeGesture.rawValue     : GestureOperation.none.rawValue,
                Key.swipeThreshold.rawValue       : 50,
                Key.controlFadeTime.rawValue      : 6,
                Key.rankingGenre.rawValue         : 0,
                Key.rankingTerm.rawValue          : 0,
                Key.searchKind.rawValue           : 0,
                Key.searchOrderKey.rawValue       : 0,
                Key.searchOrderDirection.rawValue : 0,
                
            ]
        )

        self.userDefaults = userDefaults
    }

    static  let shared       = ConfigStorage()
    private let userDefaults : UserDefaults
    

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


    func setGestureOperation( gestureType : Int, operation : Int ){
        guard let key = ConfigStorage.gestureTypeKeyMap[gestureType]
        else {
            return
        }
        setInt(operation, key: key)
    }

    func getGestureOperation( gestureType : Int ) -> Int {
        guard let key = ConfigStorage.gestureTypeKeyMap[gestureType]
        else {
            return GestureOperation.none.rawValue
        }
        
        return getInt(key: key)
    }


    var swipeThreshold : Int {
        set(threshold){
            setInt(threshold, key: .swipeThreshold)
        }
        get{
            getInt(key: .swipeThreshold)
        }
    }

    
    var rankingGenre : Int {
        set(genre){
            setInt(genre, key: .rankingGenre)
        }
        get{
            getInt(key: .rankingGenre)
        }
    }
    
    
    var rankingTerm : Int {
        set(term){
            setInt(term, key: .rankingTerm)
        }
        get{
            getInt(key: .rankingTerm)
        }
    }

    
    var searchKind : Int {
        set(kind){
            setInt(kind, key: .searchKind)
        }
        get{
            getInt(key: .searchKind)
        }
    }

    
    var searchOrderKey : Int {
        set(orderKey){
            setInt(orderKey, key: .searchOrderKey)
        }
        get{
            getInt(key: .searchOrderKey)
        }
    }
 
    
    var searchOrderDirection : Int {
        set(orderDirection){
            setInt(orderDirection, key: .searchOrderDirection)
        }
        get{
            getInt(key: .searchOrderDirection)
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
