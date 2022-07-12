//
//  NewsResponse.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import Foundation
import ObjectMapper

struct NewsResponse{
    var status : String = ""
    var totalResults : Int = 0
    var articles =  [NewsObject]()
}


extension NewsResponse: Mappable{
    public init?(map: Map) { self.init()}
    public mutating func mapping(map: Map) {
        status <- map["status"]
        totalResults <- map["totalResults"]
        articles <- map["articles"]
    }
}
