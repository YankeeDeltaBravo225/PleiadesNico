//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation


class NicoSetting {
    
    static let shared = NicoSetting()

    private init(){
        // Creating indivisual instance is prohibited
    }

    
    func saveStringCookie(_ stringCookie : String){
        let userDefaults = UserDefaults.standard
        userDefaults.set(stringCookie,forKey: "stringCookie")
        userDefaults.synchronize()
    }


    func loadStringCookie() -> String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: "stringCookie")
    }
}
