//
//  ViewModel.swift
//  CrudMysql
//
//  Created by gorbyno sitepu on 23/05/22.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject{
    @Published var items = [PostModel]()
    
    let prefixUrl = "http://localhost:9999/api"

    init()
    {
        fetchPosts()
    }
    
//    mark - retrieve data
    func fetchPosts(){
        guard let url = URL(string: "\(prefixUrl)/products") else {
            print("Not Found Url")
            return
        }
     
        
        URLSession.shared.dataTask(with: url){ ( data,res, error) in
            if error != nil{
                print("error", error?.localizedDescription ?? "")
                print("No Data")
                return
            }
            
            do{
                if let data = data{
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        self.items = result.data
                    }
                }else{
                    print("No Data")
                }
            }catch let JsonError{
                print("Fetch Json Error", JsonError.localizedDescription)
            }
        }.resume()
        
        
    }
    
    
    
    
//    mark - create data
    func createPost(parameters: [String: Any]){
        guard let url = URL(string: "\(prefixUrl)/products") else {
            print("Not Found Url")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        URLSession.shared.dataTask(with: request){ ( data,res, error) in
            if error != nil{
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do{
                if let data = data{
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        self.items = result.data
                    }
                }else{
                    print("No Data")
                }
            }catch let JsonError{
                print("Fetch Json Error", JsonError.localizedDescription)
            }
        }.resume()
    }
    
    //    mark - Update data
        func updatePost(parameters: [String: Any]){
            guard let url = URL(string: "\(prefixUrl)/products") else {
                print("Not Found Url")
                return
            }
            
            let data = try! JSONSerialization.data(withJSONObject: parameters)
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            request.httpBody = data
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            
            URLSession.shared.dataTask(with: request){ ( data,res, error) in
                if error != nil{
                    print("error", error?.localizedDescription ?? "")
                    return
                }
                
                do{
                    if let data = data{
                        let result = try JSONDecoder().decode(DataModel.self, from: data)
                        DispatchQueue.main.async {
                            self.items = result.data
                        }
                    }else{
                        print("No Data")
                    }
                }catch let JsonError{
                    print("Fetch Json Error", JsonError.localizedDescription)
                }
            }.resume()
        }
    
    
    
    //    mark - Delete data
        func deletePost(parameters: [String: Any]){
            guard let url = URL(string: "\(prefixUrl)/products") else {
                print("Not Found Url")
                return
            }
            
            let data = try! JSONSerialization.data(withJSONObject: parameters)
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            request.httpBody = data
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            
            URLSession.shared.dataTask(with: request){ ( data,res, error) in
                if error != nil{
                    print("error", error?.localizedDescription ?? "")
                    return
                }
                
                do{
                    if let data = data{
                        let result = try JSONDecoder().decode(DataModel.self, from: data)
                        DispatchQueue.main.async {
                            self.items = result.data
                        }
                    }else{
                        print("No Data")
                    }
                }catch let JsonError{
                    print("Fetch Json Error", JsonError.localizedDescription)
                }
            }.resume()
        }
    
}
