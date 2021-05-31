//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation


class MylistGroupAPI{

    // MARK: - MylistGroup
    struct MylistGroup: Codable {

        struct Content: Codable {
            let id: String
            let name: String

            enum CodingKeys: String, CodingKey {
                case id = "id"
                case name = "name"
            }
        }
        
        let mylistgroup: [Content]
        let status: String

        enum CodingKeys: String, CodingKey {
            case mylistgroup = "mylistgroup"
            case status = "status"
        }
    }


    private var myListGroup : MylistGroup?

    init(){
    }

    
    func url() -> String {
        return NicoURL.mylistGroup()
    }
    

    func decode(_ jsonText : String) throws -> MylistGroup {
        let json : NicoJson = NicoJson(jsonText)

        var group : MylistGroup
        do{
            group = try json.decode(MylistGroup.self)
        } catch {
            throw error
        }

        self.myListGroup = group
        return group
    }
    
}
