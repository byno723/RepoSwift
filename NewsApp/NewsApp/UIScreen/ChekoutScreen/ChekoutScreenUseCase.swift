//
//  ChekoutScreenUseCase.swift
//  NewsApp
//
//  Created by Gorbyno S on 14/07/22.
//

import Foundation
import Alamofire

class ChekoutScreenUseCase{
    private(set) var repository = Repository()
    var input = Input()
    var callBack = Callback()
    
    func onLoad(){
        repository.product = input.product
        callBack.onSuccess()
        print(repository.product)
    }
    
    func onSubmit(){
        Alamofire.request("https://private-fe77a9-finalproject9.apiary-mock.com/chekoutProduct")
        callBack.onSubmit()
        print("sukses submit")
    }
    
}

extension ChekoutScreenUseCase{
    class Input{
        var product = ProductsObject()
    }
    class Repository{
        var product = ProductsObject()
    }
    class Callback{
        var onSuccess : () -> Void = {return}
        var onSubmit  : () -> Void = {return}
    }
}
