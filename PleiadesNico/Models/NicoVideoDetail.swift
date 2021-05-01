//
//  NicoVideoProp.swift
//  XML_Sample
//
//  Created by katot on 2021/04/04.
//

import Foundation
import Kanna

class NicoVideoDetail{

    static func url(videoId : String) -> String{
        return "https://ext.nicovideo.jp/api/getthumbinfo/\(videoId)"
    }


    static func loadXML(_ xmlText : String) -> Prop {
        guard let xml = try? Kanna.XML(xml: xmlText, encoding: .utf8)
        else {
            return defaultProp
        }

        let xpathes : [String : String] = [
            "title"         : #"//title"#,
            "videoId"       : #"//video_id"#,
            "fileType"      : #"//movie_type"#,
            "description"   : #"//description"#,
            "thumbnail"     : #"//thumbnail_url"#,
            "uploaded"      : #"//first_retrieve"#,
            "duration"      : #"//length"#,
            "views"         : #"//view_counter"#,
            "comments"      : #"//comment_num"#,
            "mylists"       : #"//mylist_counter"#,
            "lastComment"   : #"//last_res_body"#,
            "submitterId"   : #"//user_id"#,
            "submitterName" : #"//user_nickname"#,
            "submitterIcon" : #"//user_icon_url"#,
            "channelId"     : #"//ch_id"#,
            "channelName"   : #"//ch_name"#,
            "channelIcon"   : #"//ch_icon_url"#
        ]

        let attr : [String : String] = xpathes.mapValues{ (xml.xpath($0).first?.text ?? "") }.filter{ $0.value != "" }
        let tags : [String] = xml.xpath(#"//tag"#).map{($0.text ?? "")}.filter{$0 != ""}
        
        // todo : Can share the structure with Ranking
        return Prop( attr : attr, tagList : tags )
    }

    
    static let defaultProp = Prop(attr: ["":""], tagList: [])

    struct Prop: Hashable, Codable{
        let title         : String
        let videoId       : String
        let fileType      : String
        let description   : String
        let thumbnail     : String
        let uploaded      : String
        let duration      : String
        let views         : String
        let comments      : String
        let mylists       : String
        let lastComment   : String
        let ownerType     : String
        let ownerId       : String
        let ownerName     : String
        let ownerIcon     : String
        let tags          : [String]

        init(attr : [String : String], tagList : [String]){
            title         = attr["title",         default: "no title"]
            videoId       = attr["videoId",       default: ""]
            fileType      = attr["fileType",      default: ""]
            description   = attr["description",   default: "no description"]
            thumbnail     = attr["thumbnail",     default: ""].trimmingCharacters(in: .newlines)
            uploaded      = attr["uploaded",      default: "1970/1/1"] // [todo] use ISO8601DateFormatter ?
            duration      = attr["duration",      default: "0:0"]
            views         = attr["views",         default: "-1"]
            comments      = attr["comments",      default: "-1"]
            mylists       = attr["mylists",       default: "-1"]
            lastComment   = attr["lastComment",   default: "No comment"]

            if attr.keys.contains("channelId") {
                ownerType = "チャンネル"
                ownerId   = attr["channelId",     default: ""]
                ownerName = attr["channelName",   default: ""]
                ownerIcon = attr["channelIcon",   default: ""].trimmingCharacters(in: .newlines)
            } else {
                ownerType = "投稿者"
                ownerId   = attr["submitterId",   default: ""]
                ownerName = attr["submitterName", default: ""]
                ownerIcon = attr["submitterIcon", default: ""].trimmingCharacters(in: .newlines)
            }

            tags          = tagList
        }

    }

}


