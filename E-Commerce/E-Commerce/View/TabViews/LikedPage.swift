//
//  LikedPage.swift
//  E-Commerce
//
//  Created by gorbyno sitepu on 19/05/22.
//

import SwiftUI

struct LikedPage: View {
    @EnvironmentObject var sharedData : SharedDataModel
    
//    delete option
    @State var showDeleteOption : Bool =  false
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    HStack{
                        Text("Favourites").font(.system(size: 28))
                        Spacer()
                        Button{
                            withAnimation{
                                showDeleteOption.toggle()
                            }
                        }label: {
                            Image("trash").resizable().aspectRatio(contentMode: .fit).frame(width:25, height: 25)
                        }
                        .opacity(sharedData.likedProducts.isEmpty ? 0 : 1)
                        
                    } .padding()
                   
                    
//                        checking if like products are empty
                    if sharedData.likedProducts.isEmpty{
                        Group{
                            Image("noresult").resizable().aspectRatio(contentMode: .fit).padding().padding(.top,35)
                            
                            Text("No favourites yet").font(.system(size: 25,weight: .medium))
                            
                            Text("Hit the like button on each product page to save favorite ones")
                                .font(.system(size: 18)).foregroundColor(.white)
                                .padding(.horizontal).padding(.top,10).multilineTextAlignment(.center)
                        }
                    }else{
//                        displaying products
                        VStack(spacing:15){
                            
                            ForEach(sharedData.likedProducts){product in
                                HStack(spacing:0){
                                    
                                    if showDeleteOption{
                                        Button{
                                            deleteProduct(product: product)
                                        }label: {
                                            Image(systemName: "minus.circle.fill")
                                                .font(.title2)
                                                .foregroundColor(.red)
                                        }
                                        .padding(.trailing)
                                    }
                                    
    //                                card view
                                    CardView(product:product)
                                }
                            }
                            .padding(.top,25)
                            .padding(.horizontal)
                        }
                       
                    }
                    
                }
            }
            .navigationBarHidden(true)
            .frame(maxWidth:.infinity, maxHeight: .infinity)
                .background(
                    Color.teal.ignoresSafeArea()
                )
        }
    }
    
//    card view
    @ViewBuilder
    func CardView(product: Product)-> some View{
        HStack(spacing: 15){
            Image(product.productImage).resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100)
            VStack(alignment:.leading, spacing: 8){
                Text(product.title).font(.system(size: 18, weight: .bold)).lineLimit(1)
                Text(product.subtitle).font(.system(size: 17,weight: .medium)).foregroundColor(.blue)
                Text("Type \(product.type.rawValue)").font(.system(size: 13)).foregroundColor(.gray)
            }
        }
        .padding(.horizontal,10)
        .padding(.vertical,10)
        .frame(maxWidth:.infinity, alignment: .leading)
        .background(
            Color.white.cornerRadius(10)
        )
    }
    
//    fuction delete product
    func deleteProduct(product : Product){
        if let index = sharedData.likedProducts.firstIndex(where: {
            currentProduct in
            return product.id == currentProduct.id
            
        }){
            let _ = withAnimation {
                sharedData.likedProducts.remove(at: index)
            }
        }
    }
    
    
}

struct LikedPage_Previews: PreviewProvider {
    static var previews: some View {
        LikedPage()
            .environmentObject(SharedDataModel())
    }
}
