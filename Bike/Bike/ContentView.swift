//
//  ContentView.swift
//  Bike
//
//  Created by gorbyno sitepu on 06/05/22.
//

import SwiftUI

//model data
struct ProductModel : Identifiable{
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

struct ContentView: View {
//    data baru
    let data : [ProductModel] = [
        ProductModel(id: 1, namaProduct: "Polygon 1", fotoProduct: "sepeda2", lokasi: "Cianjur", hargaProduct: 2300000, ratingCount: 5),
        ProductModel(id: 2, namaProduct: "Polygon 2", fotoProduct: "sepeda1", lokasi: "Cianjur", hargaProduct: 2100000, ratingCount: 3),
    ]
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(data){row in
                    VStack(spacing:10){
                        Product(data: row)
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Sepeda MTB")
            .navigationBarItems(leading: Text("ok"), trailing: HStack(spacing:20){
                Button(action:{print("ok")}){
                    Image(systemName: "person.fill")
                }
                Button(action:{print("ok")}){
                    Image(systemName: "cart.fill")
                }
            })
        }
        .accentColor(Color.secondary)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Product : View{
//    properti
    let data : ProductModel
    
    var body: some View{
        VStack(alignment:.leading){
            ZStack(alignment:.topTrailing){
                Image(self.data.fotoProduct).resizable().aspectRatio(contentMode: .fill)
                    .frame(height:200)
                    .clipped()
                
                Button(action:{print("ok")}){
                    Image(systemName: "heart").foregroundColor(Color.red)
                }
            }
            Text(self.data.namaProduct)
                .font(.title).bold().padding(.leading).padding(.trailing)
            Text("Rp. \(self.data.hargaProduct)")
                .font(.title).foregroundColor(Color.red).bold()
                .padding(.leading).padding(.trailing)
            
            HStack{
                Image(systemName: "mappin.circle")
                Text(self.data.lokasi)
            }
            .padding(.leading).padding(.trailing)
            
            HStack{
                HStack{
                    ForEach(0..<self.data.ratingCount){items in
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.orange)
                    }
                   
                  
                }
            }
            .padding(.leading).padding(.trailing)
            
            Button(action:{print("ok")}){
                HStack{
                    Spacer()
                    HStack{
                        Image(systemName: "cart")
                        Text("Tambah ke keranjang")
                            .font(.callout).padding()
                    }
                    Spacer()
                }
            }.background(Color.green).foregroundColor(Color.white).cornerRadius(10).padding()
        }
        .background(Color("warna"))
        .cornerRadius(10)
    }
}
