//
//  SharedDataModel.swift
//  E-Commerce
//
//  Created by gorbyno sitepu on 19/05/22.
//

import Foundation
import SwiftUI

class SharedDataModel :  ObservableObject{
//    detail product data
    
    @Published var detailProduct : Product?
    @Published var showDetailProduct : Bool =  false
    
    
//    matched geometry Effect from search page
    @Published var fromSearchPage : Bool = false
    
//    liked products
    @Published var likedProducts: [Product] = []
    
//    basket product
    @Published var cartProducts: [Product] = []
    
//    calculating Total Price
    func getTotalPrice()->String{
        var total : Int = 0
        
        cartProducts.forEach{ product in
            let price = product.price.replacingOccurrences(of: "$", with: "") as NSString
            
            let quantity = product.quatity
            let priceTotal = quantity * price.integerValue
            
            total += priceTotal
        }
        return  "$\(total)"
    }
}
