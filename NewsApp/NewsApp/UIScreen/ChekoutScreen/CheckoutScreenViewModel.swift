//
//  CheckoutScreenViewModel.swift
//  NewsApp
//
//  Created by Gorbyno S on 14/07/22.
//

import Foundation
import SwiftUI

class CheckoutScreenViewModel: ObservableObject{
    @Published var product : ProductsObject = ProductsObject()
    private(set) var useCase = ChekoutScreenUseCase()
    var onCreateNavigationLinks : () -> AnyView = {DefaultValues.emptyAnyView}
    
    func loadData(){
        useCase.onLoad()
    }
    func submitData(){
        useCase.onSubmit()
        print("?sukses")
    }
    
    func setupdData(){
        product = useCase.repository.product
    }
    
    func setUseCase(_ useCase: ChekoutScreenUseCase){
        useCase.callBack.onSuccess = setupdData
//        useCase.callBack.onSubmit = submitData
        self.useCase = useCase
    }
}
