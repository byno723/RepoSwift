//
//  NewsModels.swift
//  LoadImageJson
//
//  Created by gorbyno sitepu on 20/05/22.
//

import Foundation
import Combine
import SwiftyJSON

class NewsModels : ObservableObject{
    @Published var data = [News]()
    
    init(){
        let url = "https://newsapi.org/v2/everything?q=tesla&from=2022-04-20&sortBy=publishedAt&apiKey=783851f5d9724fa29edd960aa18baeac"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!){
            (data, _, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            
            let items = json["articles"].array!
             
            for i  in items{
                let title = i["title"].stringValue
                let description = i["description"].stringValue
                let imageUrl = i["urlToImage"].stringValue
                
                DispatchQueue.main.async {
                    self.data.append(News( title: title, image: imageUrl, description: description))
                }
            }
        }.resume()
    }
}
