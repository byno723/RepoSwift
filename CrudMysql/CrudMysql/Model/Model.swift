//
//  Model.swift
//  CrudMysql
//
//  Created by gorbyno sitepu on 23/05/22.
//

import Foundation
import SwiftUI

struct DataModel: Decodable{
    let code : Int
    let data: [PostModel]
    let message: String
  
}

struct PostModel : Decodable{
    let Id: Int
    let Code: String
    let Name : String
}
