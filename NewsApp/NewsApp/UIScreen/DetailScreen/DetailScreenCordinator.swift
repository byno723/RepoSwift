//
//  DetailScreenCordinator.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import SwiftUI

struct DetailScreenCordinator: View {
    @Binding var selectionCoordinatorName : String?
    @State private(set) var destinationCordinatorName: String?
    
    @Binding  var selectedNews : NewsObject
    @State private(set) var viewModel = DetailScreenViewModel()
    @State private(set) var useCase = DetailScreenUseCase()
    var body: some View {
        NavigationLink(
            destination: DetailScreen(
                viewModel: createViewModel()
            ),
            tag: DetailScreenCordinator.named,
            selection: $selectionCoordinatorName)
        {EmptyView()}
    }
    
    private func createViewModel() -> DetailScreenViewModel{
        if selectionCoordinatorName != DetailScreenCordinator.named{
            return viewModel
        }
        viewModel.onCreateNavigationLinks = createNavigationLinks
        viewModel.setUseCase(createUseCase())
        return viewModel
    }
    
    private func goToProductCordinator(){
        destinationCordinatorName = ProductCordinator.named
    }
    
    private func createUseCase() -> DetailScreenUseCase{
        useCase.input.Newsdata = selectedNews
        useCase.callback.onNext = goToProductCordinator
        return useCase
    }
    private func createNavigationLinks()-> AnyView{
        AnyView(
            Group{
                ProductCordinator(
                    selectionCoordinatorName: $destinationCordinatorName
//                    selectedNews: $useCase.output.dataNews
                )
            }
        )
    }

}
