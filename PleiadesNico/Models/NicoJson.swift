//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation


class NicoJson {
    
    private var jsonText          : String
    private var errorDescriptions : [String]


    init(_ text : String){
        self.jsonText          = text
        self.errorDescriptions = []
    }


    func registerError(_ description : String){
        self.errorDescriptions.append( description )
    }


    func createNsError() -> NSError {
        let domain = self.errorDescriptions.joined(separator: "\n")
        return NSError(domain: domain, code: -1, userInfo: nil)
    }


    func decode<T>(_ klass: T.Type) throws -> T where T : Decodable {
        let data      = self.jsonText.data(using: .utf8)!
        let decorder  = JSONDecoder()
        let decoded  : T

        do {
            decoded = try decorder.decode(klass, from: data)
        } catch let DecodingError.dataCorrupted(context) {
            registerError("\(context)")
            throw createNsError()
        } catch let DecodingError.keyNotFound(key, context) {
            registerError("Key '\(key)' not found: \(context.debugDescription))")
            registerError("codingPath: \(context.codingPath)")
            throw createNsError()
        } catch let DecodingError.valueNotFound(value, context) {
            registerError("Value '\(value)' not found: \(context.debugDescription)")
            registerError("codingPath: \(context.codingPath)")
            throw createNsError()
        } catch let DecodingError.typeMismatch(type, context)  {
            registerError("Type '\(type)' mismatch: \(context.debugDescription)")
            registerError("codingPath: \(context.codingPath)")
            throw createNsError()
        } catch {
            registerError("error: \(error)")
            throw createNsError()
        }
        
        return decoded
    }
    
}
