//
//  ProductResponse.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 13/07/22.
//

import SwiftUI
import ObjectMapper


struct ProductsResponse{
    var success : String = ""
    var productList =  [ProductsObject]()
}


extension ProductsResponse: Mappable{
    public init?(map: Map) { self.init()}
    public mutating func mapping(map: Map) {
        success <- map["success"]
        productList <- map["product_list"]
    }
}
