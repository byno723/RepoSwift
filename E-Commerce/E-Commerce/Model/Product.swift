//
//  Product.swift
//  E-Commerce
//
//  Created by gorbyno sitepu on 17/05/22.
//

import Foundation

// Product Model
struct Product : Identifiable,Hashable{
    var id = UUID().uuidString
    var type : ProductType
    var title : String
    var subtitle : String
    var description: String = ""
    var price : String
    var productImage: String = ""
    var quatity : Int = 1
}

//product type
enum ProductType : String, CaseIterable{
    case Wearable = "Wearable"
    case Laptops = "Laptops"
    case Phones = "Phones"
    case Tablets = "Tablets"
}
