//
//  ChekoutScreenCordinator.swift
//  NewsApp
//
//  Created by Gorbyno S on 14/07/22.
//

import SwiftUI

struct ChekoutScreenCordinator: View {
    @Binding var selectionCoordinatorName : String?
    @State private(set) var destinationCordinatorName: String?
    
    @Binding  var selectedProduct : ProductsObject
    @State private(set) var viewModel = CheckoutScreenViewModel()
    @State private(set) var useCase = ChekoutScreenUseCase()

    var body: some View {
        NavigationLink(
            destination: CheckOutScreen(
                viewModel: createViewModel()
            ),
            tag: ChekoutScreenCordinator.named,
            selection: $selectionCoordinatorName)
        {EmptyView()}
    }
    
    private func createViewModel()-> CheckoutScreenViewModel{
        if selectionCoordinatorName != ChekoutScreenCordinator.named{
            return viewModel
        }
        viewModel.onCreateNavigationLinks = createNavigationLinks
        viewModel.setUseCase(createUseCase())
        return viewModel
    }
    
    
    private func createUseCase()-> ChekoutScreenUseCase{
        useCase.input.product = selectedProduct
        useCase.callBack.onSubmit = goToSuccessCordinator
        return useCase
    }
    
    private func goToSuccessCordinator(){
        destinationCordinatorName = SuccessScreenCordinator.named
    }
    
    private func createNavigationLinks()-> AnyView{
        AnyView(
            Group{
                SuccessScreenCordinator(
                    selectionCoordinatorName: $destinationCordinatorName
//                    selectedNews: $useCase.output.dataNews
                )
            }
        )
    }
}
