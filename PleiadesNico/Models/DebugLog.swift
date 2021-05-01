//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation

class DebugLog {

    enum Importance: Int, CaseIterable {
        case debug  = 0
        case notice = 1
        case error  = 2
    }
    
    let threshold : Importance = .notice

    static let shared    = DebugLog()

    private init(){
        // Creating indivisual instance is prohibited
    }


    func debug( _ message : String) {
        printLog(message, importance : .debug)
    }


    func notice( _ message : String) {
        printLog(message, importance : .notice)
    }

    
    func error( _ message : String) {
        printLog(message, importance : .error)
    }


    func printLog( _ message : String, importance : Importance) {
        if( importance.rawValue >= threshold.rawValue ){
            print(message)
        }
    }

}
