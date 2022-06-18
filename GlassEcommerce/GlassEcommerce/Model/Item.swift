//
//  Item.swift
//  GlassEcommerce
//
//  Created by gorbyno sitepu on 24/05/22.
//

import Foundation

struct Item : Identifiable{
    var id = UUID().uuidString
    var title : String
    var subTitle: String
    var price: String
    var rating: String
    var image: String
}

//note both imgae and color are same
var items = [
    Item(title: "Vinchent Case", subTitle: "Black Full Rim", price : "$22", rating: "3.8", image:"p1"),
    Item(title: "Shavana Case", subTitle: "White Cream ", price : "$43", rating: "4.2", image:"p2"),
    Item(title: "Serive Case", subTitle: "Blue Sky ", price : "$58", rating: "2.3", image:"p3"),
    Item(title: "Yhene Case", subTitle: "Green Grass ", price : "$27", rating: "3.6", image:"p4")
]
