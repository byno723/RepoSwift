//
//  DataModel.swift
//  Bike
//
//  Created by gorbyno sitepu on 06/05/22.
//

import Foundation

//model data
struct DataModel : Identifiable{
    let id :Int
    let namaProduct : String
    let fotoProduct: String
    let lokasi : String
    let hargaProduct : Int
    let ratingCount: Int
    
    init(id: Int, namaProduct : String, fotoProduct : String, lokasi : String, hargaProduct: Int, ratingCount: Int){
        
        self.id = id
        self.namaProduct = namaProduct
        self.fotoProduct = fotoProduct
        self.lokasi = lokasi
        self.ratingCount = ratingCount
        self.hargaProduct  = hargaProduct
        
    }
    
}
