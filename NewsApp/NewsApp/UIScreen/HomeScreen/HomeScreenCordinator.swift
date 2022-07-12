//
//  HomeScreenCordinator.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import SwiftUI

struct HomeScreenCordinator: View {
    @State private var destinationCordinatorName : String?
    @State private var viewModel = HomeScreenViewModel()
    @State private var useCase = HomeScreenUseCase()
    
    var body: some View {
      HomeScreen(viewModel: createViewModel())
    }
    private func createViewModel()-> HomeScreenViewModel{
        viewModel.onCreateNavigationLinks = createNavigationLinks
        viewModel.setUseCase(createUseCase())
        return viewModel
    }
    private func createUseCase()-> HomeScreenUseCase{
        useCase.callback.onStartDetailSelection = startDetailCordinator
        return useCase
    }
    
    private func startDetailCordinator(){
        destinationCordinatorName = DetailScreenCordinator.named
    }
    
    private func createNavigationLinks()-> AnyView{
        AnyView(
            Group{
                DetailScreenCordinator(
                    selectionCoordinatorName: $destinationCordinatorName,
                    selectedNews: $useCase.output.dataNews
                )
            }
        )
    }
}
