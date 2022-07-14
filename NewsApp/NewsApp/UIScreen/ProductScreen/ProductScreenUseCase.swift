//
//  ProductScreenUseCase.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import SwiftUI
import Alamofire
import AlamofireObjectMapper

class ProductScreenUseCase{
    private(set) var repository = Repository()
    var input = Input()
    var output = Output()
    var callback = Callback()
    
    func onLoad(){
        Alamofire.request("https://private-fe77a9-finalproject9.apiary-mock.com/movie")
            .responseObject{(response : DataResponse<ProductsResponse>) in
                if let respProducts = response.result.value{
                    self.repository.dataProduct = respProducts.productList
                    self.callback.onSuccess()
                }
            }
    }
    
    func selectProducts(_ products: ProductsObject){
        output.products = products
        callback.onSelect()
        print("select product")
    }
}

extension ProductScreenUseCase{
    class Input{
      
    }
    class Output{
        var products = ProductsObject()
    }
    class Repository{
        var dataProduct = [ProductsObject]()
    }
    class Callback{
        var onSuccess : () -> Void = {return}
        var onSelect : ()-> Void = {return}
    }
}
