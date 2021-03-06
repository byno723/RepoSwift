//
//  DetailScreenUseCase.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import Foundation

class DetailScreenUseCase{
    private(set) var repository = Repository()
    var input = Input()
    var output = Output()
    var callback = CallBack()
    
    func onLoad(){
        repository.Newsdata = input.Newsdata
        callback.onSuccess()
    }
    
    func onNext(){
//        output.products = [product]
        callback.onNext()
    }
}

extension DetailScreenUseCase{
    class Input{
        var Newsdata = NewsObject()
    }
    class Output{
//        var products = [ProductsObject]()
    }
    
    class Repository{
        var Newsdata = NewsObject()
    }
    class CallBack{
        var onSuccess : () -> Void = {return}
        var onFailed : () -> Void = {return}
        var onNext : () -> Void = {return}
    }
}
