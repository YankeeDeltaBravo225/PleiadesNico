//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation


class NicoSetting {
    
    static  let shared       = NicoSetting()
    private let userDefaults : UserDefaults


    // Creating indivisual instance is prohibited
    private init(){
        let userDefaults = UserDefaults.standard

        userDefaults.register(
            defaults: [
                "isLoggedIn"   : false,
                "stringCookie" : ""
            ]
        )

        self.userDefaults = userDefaults
    }


    func saveStringCookie(_ stringCookie : String){
        self.userDefaults.set(stringCookie,forKey: "stringCookie")
        self.userDefaults.synchronize()
    }


    func loadStringCookie() -> String? {
        return self.userDefaults.string(forKey: "stringCookie")
    }


    func saveLoginStatus(_ isLoggedIn : Bool) {
        self.userDefaults.set(isLoggedIn,forKey: "isLoggedIn")
        self.userDefaults.synchronize()
    }

    func loadLoginStatus() -> Bool {
        return self.userDefaults.bool(forKey: "isLoggedIn")
    }

    
    
    
}
