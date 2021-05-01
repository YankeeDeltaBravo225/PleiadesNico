//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation


class DateTimeFormat {

    static func duration(_ sec : Int) -> String {
        return duration( Double(sec) )
    }


    static func duration(_ sec : Double) -> String {
        if isInvalid(sec){
            return "--:--"
        }

        if(sec > 3600.0) {
            return hmsFormat(sec)
        } else {
            return msFormat(sec)
        }
    }


    static func time(_ elapsedSec : Double, _ durationSec : Double) -> String {
        if isInvalid(elapsedSec) || isInvalid(durationSec) {
            return "--:--"
        }

        if(durationSec > 3600.0) {
            return hmsFormat(elapsedSec)
        } else {
            return msFormat(elapsedSec)
        }
    }


    static func isInvalid(_ rawSec : Double) -> Bool {
        return (rawSec.isNaN || rawSec < 0)
    }
    

    static func hmsFormat(_ sec : Double ) -> String {
        let intSec = Int(sec)

        let h = intSec / 3600
        let m = (intSec % 3600) / 60
        let s = intSec % 60
        return String(format: "%02d:%02d:%02d", h, m, s)
    }
    

    static func msFormat(_ sec : Double ) -> String {
        let intSec = Int(sec)

        let m = (intSec % 3600) / 60
        let s = intSec % 60
        return String(format: "%02d:%02d", m, s)
    }

}
