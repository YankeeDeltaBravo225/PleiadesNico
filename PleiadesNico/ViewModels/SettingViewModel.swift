//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation
import WebKit

final class SettingViewModel: ObservableObject {

    let loginPageUrl = NicoURL.loginPage
    @Published var isLoggedIn      : Bool
    @Published var commentFontSize : Int
    @Published var controlFadeTime : Int
    

    init(){
        self.isLoggedIn      = ConfigStorage.shared.loginStatus
        self.commentFontSize = ConfigStorage.shared.commentFontSize
        self.controlFadeTime = ConfigStorage.shared.controlFadeTime
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

    
    func onControlFadeTimeChanged(_ isPressed : Bool){
        if isPressed {
            return
        }

        ConfigStorage.shared.controlFadeTime = self.controlFadeTime
    }

}
