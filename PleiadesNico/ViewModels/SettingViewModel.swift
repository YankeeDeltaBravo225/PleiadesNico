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
    let orientations      : [String] = ConfigStorage.playerOrientationDescriptions
    let gestureTypes      : [String] = ConfigStorage.gestureTypeDescriptions
    let gestureOperations : [String] = ConfigStorage.gestureOperationDescriptions

    @Published var isLoggedIn        : Bool
    @Published var commentFontSize   : Int
    @Published var commentStrokeSize : Int
    @Published var controlFadeTime   : Int
    @Published var playerOrientation : Int
    @Published var gestureOperationSelects : [Int]

    init(){
        self.isLoggedIn              = ConfigStorage.shared.loginStatus
        self.commentFontSize         = ConfigStorage.shared.commentFontSize
        self.commentStrokeSize       = ConfigStorage.shared.commentStrokeSize
        self.controlFadeTime         = ConfigStorage.shared.controlFadeTime
        self.playerOrientation       = ConfigStorage.shared.playerOrientation
        self.gestureOperationSelects = GestureType.allValues
            .map{ ConfigStorage.shared.getGestureOperation(gestureType: $0.rawValue) }
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


    func onControlFadeTimeChanged(_ isPressed : Bool){
        if isPressed {
            return
        }

        ConfigStorage.shared.controlFadeTime = self.controlFadeTime
    }

    func onOrietationChanged(_ newOrientation : Int){
        self.playerOrientation                 = newOrientation
        ConfigStorage.shared.playerOrientation = newOrientation
    }

    func onGestureChanged(gestureType : Int, newOperation : Int){
        self.gestureOperationSelects[gestureType] = newOperation
        ConfigStorage.shared.setGestureOperation(gestureType: gestureType, operation: newOperation)
    }
    
    
}
