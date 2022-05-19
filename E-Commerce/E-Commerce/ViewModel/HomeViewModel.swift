//
//  HomeViewModel.swift
//  E-Commerce
//
//  Created by gorbyno sitepu on 17/05/22.
//

import Foundation
import SwiftUI

//using combine to monitor search field and if user leave for .5 secs then starts searching ..
//to avoid memory issue
import Combine

class HomeViewModel:ObservableObject{
    @Published var productType : ProductType = .Wearable
    
//    sample product
    @Published var products : [Product] = [
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 6: Red", price:"$359", productImage: "smartwatch" ),
        Product(type: .Wearable, title: "Apple Watch 1", subtitle: "Series 6: Red", price:"$359", productImage: "smartwatch1" ),
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 6: Red", price:"$359", productImage: "smartwatch" ),
        Product(type: .Phones, title: "Apple Watch", subtitle: "Series 6: Red", price:"$359", productImage: "smartwatch" ),
        Product(type: .Phones, title: "Apple Watch", subtitle: "Series 6: Red", price:"$359", productImage: "smartwatch" ),
        Product(type: .Phones, title: "Apple Watch", subtitle: "Series 6: Red", price:"$359", productImage: "smartwatch" ),
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 6: Red", price:"$359", productImage: "smartwatch" ),
        Product(type: .Laptops, title: "Apple Watch", subtitle: "Series 6: Red", price:"$359", productImage: "smartwatch" ),
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 6: Red", price:"$359", productImage: "smartwatch" ),
        Product(type: .Laptops, title: "Laptops Apple", subtitle: "Series 6: Red", price:"$359", productImage: "laptop" ),
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 6: Red", price:"$359", productImage: "smartwatch" ),
        Product(type: .Tablets, title: "Apple Watch", subtitle: "Series 6: Red", price:"$359", productImage: "smartwatch" ),
        Product(type: .Tablets, title: "Apple Watch", subtitle: "Series 6: Red", price:"$359", productImage: "smartwatch" ),
        Product(type: .Laptops, title: "Apple Watch", subtitle: "Series 6: Red", price:"$359", productImage: "smartwatch" ),
    ]
    
//    filter products
    @Published var filteredProducts : [Product] = []
    
//    more product on the type
    @Published var showMoreProductsOnType : Bool = false
    
//    search data
    @Published var searchText : String = ""
    @Published var searchActivated : Bool = false
    @Published var searchProducts : [Product]?
    
    var searchCancellable: AnyCancellable?
    
    init(){
        filterProductByType()
        
        searchCancellable = $searchText.removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                if str != ""{
                    self.filterProductBySearch()
                }else{
                    self.searchProducts = nil
                }
            })
    }
    
    func filterProductByType(){
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.products
                .lazy
                .filter{ [self] product in
                    return product.type == self.productType
                }
//            limit result
                .prefix(4)
            
            DispatchQueue.main.async {
                self.filteredProducts = results.compactMap({ product in
                    return product
                })
            }
            
        }
    }
    
    func filterProductBySearch(){
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.products
                .lazy
                .filter{ [self] product in
                    return product.title.lowercased().contains(self.searchText.lowercased())
                }
            
            DispatchQueue.main.async {
                self.searchProducts = results.compactMap({ product in
                    return product
                })
            }
            
        }
    }
}
