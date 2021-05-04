//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation
import WebKit

final class SettingViewModel: ObservableObject {

    let loginPageUrl = NicoURL.loginPage

    init(){
        
    }

    func onLogginDisappear(webView : WKWebView) {
        webView.configuration.websiteDataStore.httpCookieStore.getAllCookies() { (cookies) in
            let stringCookie = cookies
                                .filter{ $0.domain.contains(NicoURL.cookieDomain) }
                                .reduce(""){ $0 + "\($1.name)=\($1.value);" }
            NicoSetting.shared.saveStringCookie(stringCookie)

            let lastUrlText : String = webView.url?.absoluteString ?? ""
            let isLoggedIn  : Bool   = lastUrlText.hasPrefix(NicoURL.accountPage)
            NicoSetting.shared.saveLoginStatus(isLoggedIn)
        }
    }

}



