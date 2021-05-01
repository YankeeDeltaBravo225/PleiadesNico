//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation

class NicoLogin {
    
    static let url = "https://secure.nicovideo.jp/secure/login?site=niconico"
    
    static func postData(mail : String, password:String) -> Data{
        let data = "mail=\(mail)&password=\(password)&next_url=".data(using: .utf8)!

        return data
    }


    struct NicoUser {
        let mail     : String
        let password : String
    }
    
}
