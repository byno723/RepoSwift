//
//  Post.swift
//  Staggered Grid
//
//  Created by gorbyno sitepu on 19/05/22.
//

import Foundation
import SwiftUI

struct Post : Identifiable, Hashable{
    var id = UUID().uuidString
    var imageURL: String
}
