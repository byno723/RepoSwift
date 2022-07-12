//
//  CategoryModel.swift
//  TopUpEmoney
//
//  Created by gorbyno sitepu on 27/06/22.
//

import Foundation

struct CategoryModel: Codable, Hashable{
    let data: [PostModel]
}


struct PostModel : Codable, Hashable{
    let id: Int
    let title: String
}
