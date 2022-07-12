//
//  Route.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import Foundation
import SwiftUI


enum ScreenName: String{
    case detailScreen = "DetailScreen"
    case ProductScreen = "ProductScreen"
}

extension View{
    static var named : String{
        String(describing: self)
    }
}
struct DefaultValues{
    static let emptyAnyView = AnyView( EmptyView() )
}
