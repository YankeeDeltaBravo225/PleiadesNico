//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation


class DateTimeFormat {

    let iso8601Formatter : ISO8601DateFormatter
    let dateFormatter    : DateFormatter
    let timeFormatter    : DateFormatter
    
    // Singleton instance
    static let shared    = DateTimeFormat()

    
    // Creating indivisual instance is prohibited
    private init(){
        let dateFormatter = DateFormatter()
        dateFormatter.locale     = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy/MM/dd(EEE) HH:mm:ss"
        dateFormatter.dateStyle  = .full
        dateFormatter.timeStyle  = .short
        self.dateFormatter    = dateFormatter

        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle  = .none
        timeFormatter.timeStyle  = .long
        self.timeFormatter = timeFormatter

        self.iso8601Formatter = ISO8601DateFormatter()
    }


    func duration(_ sec : Int) -> String {
        return duration( Double(sec) )
    }


    func duration(_ sec : Double) -> String {
        if isInvalid(sec){
            return "--:--"
        }

        if(sec > 3600.0) {
            return hmsFormat(sec)
        } else {
            return msFormat(sec)
        }
    }


    func time(_ elapsedSec : Double, _ durationSec : Double) -> String {
        if isInvalid(elapsedSec) || isInvalid(durationSec) {
            return "--:--"
        }

        if(durationSec > 3600.0) {
            return hmsFormat(elapsedSec)
        } else {
            return msFormat(elapsedSec)
        }
    }


    func isInvalid(_ rawSec : Double) -> Bool {
        return (rawSec.isNaN || rawSec < 0)
    }
    

    func hmsFormat(_ sec : Double ) -> String {
        let intSec = Int(sec)

        let h = intSec / 3600
        let m = (intSec % 3600) / 60
        let s = intSec % 60
        return String(format: "%02d:%02d:%02d", h, m, s)
    }
    

    func msFormat(_ sec : Double ) -> String {
        let intSec = Int(sec)

        let m = (intSec % 3600) / 60
        let s = intSec % 60
        return String(format: "%02d:%02d", m, s)
    }


    func dateFromISO8601(_ iso8601date : String) -> String {
        guard let date = self.iso8601Formatter.date( from: iso8601date )
        else {
            return "Invalid date"
        }
        
        return self.dateFormatter.string(from: date)
    }

    
    func currentTime() -> String {
        return self.timeFormatter.string(from: Date())
    }

}
