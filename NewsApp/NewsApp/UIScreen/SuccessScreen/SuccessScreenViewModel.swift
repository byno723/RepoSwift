//
//  SuccessScreenViewModel.swift
//  NewsApp
//
//  Created by Gorbyno S on 14/07/22.
//

import Foundation

class SuccessScreenViewModel: ObservableObject{
//    @Published
    private(set) var useCase = DetailScreenUseCase()
    
    func onNext(){
        useCase.onNext()
        print("next berhasil")
    }
    
}
