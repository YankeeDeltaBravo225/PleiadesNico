//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation
import WebKit

final class SettingViewModel: ObservableObject {


    init(){
        
    }

    func onLogginDisappear(webView : WKWebView) {
        webView.configuration.websiteDataStore.httpCookieStore.getAllCookies() { (cookies) in
            var stringCookie = ""
            
            for eachcookie in cookies {
                if eachcookie.domain.contains(".nicovideo.jp"){
                    stringCookie += "\(eachcookie.name)=\(eachcookie.value);"
                }
            }
            
            NicoSetting.shared.saveStringCookie(stringCookie)
        }
    }

}



