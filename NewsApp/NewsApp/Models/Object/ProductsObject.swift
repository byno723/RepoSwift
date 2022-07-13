//
//  ProductsObject.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 13/07/22.
//

import Foundation
import ObjectMapper


struct ProductsObject{
    var id : String = ""
    var title : String = ""
    var harga : Int = 0
    var imageUrl :  String = ""
}


extension ProductsObject: Mappable, Hashable{
    public init?(map: Map) { self.init()}
    public mutating func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        harga <- map["harga"]
        imageUrl <- map["image_url"]
    }
}
