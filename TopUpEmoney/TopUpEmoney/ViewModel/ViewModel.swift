//
//  ViewModel.swift
//  TopUpEmoney
//
//  Created by gorbyno sitepu on 27/06/22.
//

import Foundation
import Alamofire

class ViewModel : ObservableObject{
    @Published var items = PostModel()
    
    let prefixUrl = "https://private-fe77a9-finalproject9.apiary-mock.com"

    init()
    {
        fetchDataCategory()
    }
    
    func fetchDataCategory(){
        guard let url = URL(string: "\(prefixUrl)/questions") else {
                  print("Not Found Url")
                  return
              }
        AF.request(url)
            .validate()
            .responseDecodable(of: CategoryModel.self){ (response) in
                switch response.result{
                case .success:
                    guard let resp = response.value else { return}
                    self.items = resp.data
                case let .failure(error) :
                    print(error)
                }
            }
    }
}
