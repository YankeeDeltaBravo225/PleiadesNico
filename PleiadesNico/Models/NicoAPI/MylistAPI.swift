//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation


class MylistAPI{

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

    
    // MARK: - Mylist
    struct Mylist: Codable {

        struct Content: Codable {

            struct ItemData: Codable {
                let videoID: String
                let title: String
                let thumbnailURL: String
                let firstRetrieve: Int
                let viewCounter: String
                let mylistCounter: String
                let numRes: String
                let lengthSeconds: String
                let deleted: String?
                let lastResBody: String

                enum CodingKeys: String, CodingKey {
                    case videoID = "video_id"
                    case title = "title"
                    case thumbnailURL = "thumbnail_url"
                    case firstRetrieve = "first_retrieve"
                    case viewCounter = "view_counter"
                    case mylistCounter = "mylist_counter"
                    case numRes = "num_res"
                    case lengthSeconds = "length_seconds"
                    case deleted = "deleted"
                    case lastResBody = "last_res_body"
                }
            }

            let itemType: Int
            let itemID: String
            let itemData: ItemData

            enum CodingKeys: String, CodingKey {
                case itemType = "item_type"
                case itemID = "item_id"
                case itemData = "item_data"
            }
        }

        let mylistitem: [Content]
        let status: String

        enum CodingKeys: String, CodingKey {
            case mylistitem = "mylistitem"
            case status = "status"
        }
    }


    private var myListGroup : MylistGroup?
    private var mylist      : Mylist?

    init(){
        
    }

    
    func mylistGroupUrl() -> String {
        return NicoURL.mylistGroup()
    }

    
    func mylistUrl(_ mylistId : String) -> String {
        return NicoURL.mylist( mylistId )
    }
    

    func decodeGroup(_ jsonText : String) throws -> MylistGroup {
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


    func decodeMylist(_ jsonText : String) throws -> Mylist {
        let json : NicoJson = NicoJson(jsonText)

        var mylist : Mylist
        do{
            mylist = try json.decode(Mylist.self)
        } catch {
            throw error
        }

        self.mylist = mylist
        return mylist
    }
    
}
