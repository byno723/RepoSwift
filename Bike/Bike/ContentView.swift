//
//  ContentView.swift
//  Bike
//
//  Created by gorbyno sitepu on 06/05/22.
//

import SwiftUI


struct ContentView: View {
//    data baru
    let data : [DataModel] = [
        DataModel(id: 1, namaProduct: "Polygon 1", fotoProduct: "sepeda2", lokasi: "Cianjur", hargaProduct: 2300000, ratingCount: 5),
        DataModel(id: 2, namaProduct: "Polygon 2", fotoProduct: "sepeda1", lokasi: "Cianjur", hargaProduct: 2100000, ratingCount: 3),
    ]
    
    
//    @State var jumlahkeranjang : Int = 0
    @ObservedObject var globaldata = GlobalObject()
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                ForEach(data){row in
                    VStack(spacing:10){
                        Product(data: row, jumlahkeranjang: self.globaldata)
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Sepeda MTB")
            .navigationBarItems(leading: Text("ok"), trailing: HStack(spacing:20){
                Button(action:{print("ok")}){
                    Image(systemName: "person.fill")
                }
                NavigationLink(destination:DetailView(globaldata: globaldata)){
               KeranjangView(jumlahkeranjang: globaldata)
                }
                
            })
        }
        .accentColor(Color.secondary)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct KeranjangView : View{
    
//    @Binding var jumlah : Int
    @ObservedObject var jumlahkeranjang : GlobalObject
    
    var body: some View{
        ZStack{
          
                Image(systemName: "cart.fill")
            
            Text("\(self.jumlahkeranjang.jumlah)")
                .foregroundColor(Color.white)
                .frame(width:10, height: 10)
                .font(.body)
                .padding(5)
                .background(Color.red)
                .clipShape(Circle())
                .offset(x:12)
                .offset(y:-10)
        }
    }
}

struct DetailView : View{
    @ObservedObject var globaldata : GlobalObject
    
    var body: some View{
        NavigationView{
            Text("Detail")
                .navigationBarTitle("Detail")
                .navigationBarItems( trailing: HStack(spacing:20){
                 
                        Image(systemName: "person.fill")
                    
                    KeranjangView(jumlahkeranjang: globaldata)
                  
                    
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Product : View{
//    properti
    let data : DataModel
//    @Binding var jumlahProduct : Int
    
    @ObservedObject var jumlahkeranjang : GlobalObject
    
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
            
            tambahKeranjang(keranjang: jumlahkeranjang)
           
        }
        .background(Color("warna"))
        .cornerRadius(10)
    }
}

//button
struct tambahKeranjang : View{
    
//    @Binding var jumlah:Int
    
    @ObservedObject var keranjang : GlobalObject
    
    var body: some View{
        Button(action:{self.keranjang.jumlah+=1}){
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
}
