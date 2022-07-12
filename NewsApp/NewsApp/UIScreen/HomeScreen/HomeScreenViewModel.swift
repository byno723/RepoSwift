//
//  HomeScreenViewModel.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import SwiftUI
import Alamofire
import AlamofireObjectMapper

class HomeScreenViewModel: ObservableObject{
    @Published var newsList = [NewsObject]()
    @Published var selectedNews : NewsObject =  NewsObject()
    var onCreateNavigationLinks : () -> AnyView = {DefaultValues.emptyAnyView}
    
    private(set) var useCase = HomeScreenUseCase()
    
    func loadData(){
        useCase.onLoad()
    }
    
    func selectNews(_ news : NewsObject){
        useCase.selectNews(news)
    }
    
    func setupLoadData(){
        newsList = useCase.repository.dataNews
    }
    
    func setUseCase(_ useCase: HomeScreenUseCase){
        useCase.callback.onSuccess = setupLoadData
        self.useCase = useCase
    }
    
}
