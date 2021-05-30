//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation
import WebKit

final class SettingViewModel: ObservableObject {

    typealias Orientation = ConfigStorage.PlayerOrientation
    typealias GestureType = ConfigStorage.GestureType

    let loginPageUrl      : String   = NicoURL.loginPage

    @Published var isLoggedIn              : Bool  = ConfigStorage.shared.loginStatus
    @Published var commentFontSize         : Int   = ConfigStorage.shared.commentFontSize
    @Published var commentStrokeSize       : Int   = ConfigStorage.shared.commentStrokeSize
    @Published var commentMaxDispNum       : Int   = ConfigStorage.shared.commentMaxDispNum
    @Published var controlFadeTime         : Int   = ConfigStorage.shared.controlFadeTime
    @Published var playerOrientation       : Int   = ConfigStorage.shared.playerOrientation
    @Published var swipeThreshold          : Int   = ConfigStorage.shared.swipeThreshold
    @Published var gestureOperationSelects : [Int] = GestureType.allValues
        .map{ ConfigStorage.shared.getGestureOperation(gestureType: $0.rawValue) }
    
    init(){
    }


    func onLogginDisappear(webView : WKWebView) {
        webView.configuration.websiteDataStore.httpCookieStore.getAllCookies() { (cookies) in
            let stringCookie = cookies
                                .filter{ $0.domain.contains(NicoURL.cookieDomain) }
                                .reduce(""){ $0 + "\($1.name)=\($1.value);" }
            ConfigStorage.shared.stringCookie = stringCookie

            let lastUrlText : String = webView.url?.absoluteString ?? ""
            self.isLoggedIn = lastUrlText.hasPrefix(NicoURL.accountPage)
            ConfigStorage.shared.loginStatus = self.isLoggedIn
        }
    }
    
    
    func onOpenSupportTwitter() {
        guard let url = URL(string: NicoURL.supportPage) else {return}
        UIApplication.shared.open(url, options: [.universalLinksOnly: false], completionHandler: {completed in
            print(completed)
        })
    }

    
    func onCommentFontSizeChanged(_ isPressed : Bool){
        if isPressed {
            return
        }

        ConfigStorage.shared.commentFontSize = self.commentFontSize
    }

    
    func onCommentStrokeSizeChanged(_ isPressed : Bool){
        if isPressed {
            return
        }

        ConfigStorage.shared.commentStrokeSize = self.commentStrokeSize
    }

    
    func onCommentMaxDispNumChanged(_ isPressed : Bool){
        if isPressed {
            return
        }

        ConfigStorage.shared.commentMaxDispNum = self.commentMaxDispNum
    }
    

    func onControlFadeTimeChanged(_ isPressed : Bool){
        if isPressed {
            return
        }

        ConfigStorage.shared.controlFadeTime = self.controlFadeTime
    }


    func orientationOptions() -> [Int : String] {
        let options : [Int : String] = [
            ConfigStorage.PlayerOrientation.none.rawValue           : "そのまま",
            ConfigStorage.PlayerOrientation.portrait.rawValue       : "たて(homeボタン下)",
            ConfigStorage.PlayerOrientation.landscapeRight.rawValue : "よこ(homeボタン左)",
            ConfigStorage.PlayerOrientation.landscapeLeft.rawValue  : "よこ(homeボタン右)"
        ]
        return options
    }


    func onOrietationChanged(_ newOrientation : Int){
        self.playerOrientation                 = newOrientation
        ConfigStorage.shared.playerOrientation = newOrientation
    }


    func gestureTypeOptions() -> [Int : String] {
        let options : [Int : String] = [
            ConfigStorage.GestureType.swipeLeft.rawValue  : "左スワイプ",
            ConfigStorage.GestureType.swipeRight.rawValue : "右スワイプ",
            ConfigStorage.GestureType.swipeUp.rawValue    : "上スワイプ",
            ConfigStorage.GestureType.swipeDown.rawValue  : "下スワイプ",
        ]
        return options
    }


    func gestureOperationOptions() -> [Int : String] {
        let options : [Int : String] = [
            ConfigStorage.GestureOperation.none.rawValue       : "なし",
            ConfigStorage.GestureOperation.close.rawValue      : "閉じる",
            ConfigStorage.GestureOperation.plus10Sec.rawValue  : "10秒進む",
            ConfigStorage.GestureOperation.minus10Sec.rawValue : "10秒戻る",
        ]
        return options
    }


    func onGestureChanged(gestureType : Int, newOperation : Int){
        self.gestureOperationSelects[gestureType] = newOperation
        ConfigStorage.shared.setGestureOperation(gestureType: gestureType, operation: newOperation)
    }
    

    func onSwipeThresholdChanged(_ isPressed : Bool){
        if isPressed {
            return
        }

        ConfigStorage.shared.swipeThreshold = self.swipeThreshold
    }

}
