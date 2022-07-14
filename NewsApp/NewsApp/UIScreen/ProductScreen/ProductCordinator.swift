//
//  ProductCordinator.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import SwiftUI

struct ProductCordinator: View {
    @State private var destinationCordinatorName : String?
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
        viewModel.onCreateNavigationLinks = createNavigationLinks
        return viewModel
    }
//
    private func createUseCase()-> ProductScreenUseCase{
        useCase.callback.onSelect = onStartProductCordinator
        return useCase
    }
    private func onStartProductCordinator(){
        destinationCordinatorName = ChekoutScreenCordinator.named
    }
    
    private func createNavigationLinks()-> AnyView{
        AnyView(
            Group{
                ChekoutScreenCordinator(
                    selectionCoordinatorName: $destinationCordinatorName,
                    selectedProduct: $useCase.output.products
                )
            }
        )
    }
    
    
}
