//
//  DetailScreenViewModel.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import Foundation

class DetailScreenViewModel: ObservableObject{
    @Published var dataDetailNews : NewsObject = NewsObject()
   
    init(dataDetailNews: NewsObject){
        self.dataDetailNews = dataDetailNews
    }
    
}
