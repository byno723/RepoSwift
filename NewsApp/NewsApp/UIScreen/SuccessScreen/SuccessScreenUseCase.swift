//
//  SuccessScreenUseCase.swift
//  NewsApp
//
//  Created by Gorbyno S on 14/07/22.
//

import Foundation

class SuccessScreenUseCase{
    
    var callback = CallBack()
    
    func onNext(){
        callback.onSuccess()
    }
    
}
extension SuccessScreenUseCase{
//    class Input{
//
//    }
//    class Output{
//
//    }
//    class Repository{
//
//    }
    class CallBack{
        var onSuccess : ()-> Void = {return}
    }
}
