//
//  NewsObject.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import Foundation
import ObjectMapper

struct NewsObject{
    var title : String = ""
    var description : String = ""
    var urlToImage : String = ""
}

extension NewsObject: Mappable, Hashable{
    public init?(map: Map) { self.init()}
    public mutating func mapping(map: Map) {
        title <- map["title"]
        description <- map["description"]
        urlToImage <- map["urlToImage"]
    }
}
