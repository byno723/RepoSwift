//
//  ProductScreenViewModel.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import SwiftUI

class ProductScreenViewModel: ObservableObject{
    @Published var navigationSelection : String?
    @Published private(set) var products = [ProductsObject]()
    @Published var selectedProducts : ProductsObject =  ProductsObject()
    private(set) var useCase = ProductScreenUseCase()
    var onCreateNavigationLinks : () -> AnyView = {DefaultValues.emptyAnyView}
    
    func loadData(){
        useCase.onLoad()
    }
    func selectProduct(_ products : ProductsObject){
        useCase.selectProducts(products)
    }
    
    func setupDataProduct(){
        products = useCase.repository.dataProduct
    }
    func setUseCase(_ useCase: ProductScreenUseCase){
        useCase.callback.onSuccess = setupDataProduct
        self.useCase = useCase
    }
}
