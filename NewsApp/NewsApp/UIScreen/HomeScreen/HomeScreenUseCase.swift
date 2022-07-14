//
//  HomeScreenUseCase.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import Foundation
import Alamofire

class HomeScreenUseCase{
    private(set) var repository = Repository()
    
    var output = Output()
    var callback = Callback()
    
    func onLoad(){
        Alamofire.request("https://newsapi.org/v2/everything?q=tesla&from=2022-06-14&sortBy=publishedAt&apiKey=c6262feb3ee7422eab85ebd9f6414e88")
            .responseObject{(response : DataResponse<NewsResponse>) in
                if let respNews = response.result.value{
                    self.repository.dataNews = respNews.articles
                    self.callback.onSuccess()
                }
            }
    }
    
    func selectNews(_ news: NewsObject){
        output.dataNews = news
        callback.onStartDetailSelection()
    }
}

extension HomeScreenUseCase{
    
    class Output{
        var dataNews = NewsObject()
    }
    class Repository {
        var dataNews = [NewsObject]()
    }
    class Callback{
        var onSuccess : () -> Void = { return }
        var onFailed : () -> Void = { return }
        var onStartDetailSelection : () -> Void = { return }
    }
}
