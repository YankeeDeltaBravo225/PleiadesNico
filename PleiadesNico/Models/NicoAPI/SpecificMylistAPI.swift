//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation

class SpecificMylistAPI{
    
    // MARK: - Mylist
    struct Mylist: Codable {

        struct Content: Codable {

            struct ItemData: Codable {
                let videoID: String
                let title: String
                let thumbnailURL: String
                let firstRetrieve: Int
                let updateTime: Int
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
                    case updateTime = "update_time"
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
    

    private let listId : String
    private var mylist : Mylist?
    

    init(_ listId : String){
        self.listId = listId
    }


    func url() -> String {
        return NicoURL.mylist( self.listId )
    }


    func decode(_ jsonText : String) throws -> Mylist {
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
