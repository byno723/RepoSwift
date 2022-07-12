//
//  DetailScreenViewModel.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import Foundation
import SwiftUI

class DetailScreenViewModel: ObservableObject{
    @Published var dataDetailNews : NewsObject = NewsObject()
    private(set) var useCase = DetailScreenUseCase()
    var onCreateNavigationLinks : () -> AnyView = {DefaultValues.emptyAnyView}
    
    func loadData(){
        useCase.onLoad()
    }
    
    func onNext(){
        useCase.onNext()
        print("next berhasil")
    }
    
    func setupOnLoad(){
        dataDetailNews = useCase.repository.Newsdata
        print("Masuk repo")
    }
    
    func setUseCase(_ useCase: DetailScreenUseCase){
        useCase.callback.onSuccess = setupOnLoad
        self.useCase = useCase
    }
//    init(dataDetailNews: NewsObject){
//        self.dataDetailNews = dataDetailNews
//    }
    
}
