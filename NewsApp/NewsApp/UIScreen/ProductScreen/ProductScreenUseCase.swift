//
//  ProductScreenUseCase.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import SwiftUI

class ProductScreenUseCase{
    private(set) var repository = Repository()
    var output = Output()
    var input = Input()
    var callback = Callback()
    
    func onNext(){
        callback.onNext()
    }
}

extension ProductScreenUseCase{
    class Input{
        
    }
    class Output{
        
    }
    class Repository{
        
    }
    class Callback{
        var onNext : () -> Void = {return}
    }
}
