//
//  ProductCordinator.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import SwiftUI

struct ProductCordinator: View {
    @Binding var selectionCoordinatorName : String?
    @State private var viewModel = ProductScreenViewModel()
    @State private(set) var useCase = ProductScreenUseCase()
    
    
    var body: some View {
        NavigationLink(
            destination: ProductScreen(
                viewModel: createViewModel()
            ),
            tag: ProductCordinator.named,
            selection: $selectionCoordinatorName)
        {EmptyView()}
    }
    
    private func createViewModel() -> ProductScreenViewModel{
        viewModel.setUseCase(createUseCase())
        return viewModel
    }
//
    private func createUseCase()-> ProductScreenUseCase{
//        useCase.callback.onSuccess
        return useCase
    }
    
    
}
