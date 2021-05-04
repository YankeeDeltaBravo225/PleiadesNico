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
        self.isLoggedIn      = NicoSetting.shared.loginStatus
        self.commentFontSize = NicoSetting.shared.commentFontSize
        self.controlFadeTime = NicoSetting.shared.controlFadeTime
    }


    func onLogginDisappear(webView : WKWebView) {
        webView.configuration.websiteDataStore.httpCookieStore.getAllCookies() { (cookies) in
            let stringCookie = cookies
                                .filter{ $0.domain.contains(NicoURL.cookieDomain) }
                                .reduce(""){ $0 + "\($1.name)=\($1.value);" }
            NicoSetting.shared.stringCookie = stringCookie

            let lastUrlText : String = webView.url?.absoluteString ?? ""
            self.isLoggedIn = lastUrlText.hasPrefix(NicoURL.accountPage)
            NicoSetting.shared.loginStatus = self.isLoggedIn
        }
    }
    
    
    func onCommentFontSizeChanged(_ isPressed : Bool){
        if !isPressed {
            return
        }

        NicoSetting.shared.commentFontSize = self.commentFontSize
    }

    
    func onControlFadeTimeChanged(_ isPressed : Bool){
        if !isPressed {
            return
        }

        NicoSetting.shared.controlFadeTime = self.controlFadeTime
    }

}
