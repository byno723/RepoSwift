//
//  CartPage.swift
//  E-Commerce
//
//  Created by gorbyno sitepu on 19/05/22.
//

import SwiftUI

struct CartPage: View {
    @EnvironmentObject var sharedData : SharedDataModel
    
//    delete option
    @State var showDeleteOption : Bool =  false
    
    var body: some View {
        NavigationView{
            VStack(spacing:10){
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        HStack{
                            Text("Basket").font(.system(size: 28))
                            Spacer()
                            Button{
                                withAnimation{
                                    showDeleteOption.toggle()
                                }
                            }label: {
                                Image("trash").resizable().aspectRatio(contentMode: .fit).frame(width:25, height: 25)
                            }
                            .opacity(sharedData.cartProducts.isEmpty ? 0 : 1)
                            
                        } .padding()
                       
                        
    //                        checking if like products are empty
                        if sharedData.cartProducts.isEmpty{
                            Group{
                                Image("noresult").resizable().aspectRatio(contentMode: .fit).padding().padding(.top,35)
                                
                                Text("No Items added").font(.system(size: 25,weight: .medium))
                                
                                Text("Hit the like pluss button to save into basket.")
                                    .font(.system(size: 18)).foregroundColor(.white)
                                    .padding(.horizontal).padding(.top,10).multilineTextAlignment(.center)
                            }
                        }else{
    //                        displaying products
                            VStack(spacing:15){
                                
                                ForEach($sharedData.cartProducts){$product in
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
                                        CardView(product:$product)
                                    }
                                }
                                .padding(.top,25)
                                .padding(.horizontal)
                            }
                           
                        }
                        
                    }
                }
                
//                showing total and check out button..
                if !sharedData.cartProducts.isEmpty{
                    Group{
                        HStack{
                            Text("Total")
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                            Text(sharedData.getTotalPrice())
                                .font(.system(size: 18,weight: .bold)).foregroundColor(.blue)
                        }
                       
                        Button{
                            
                        }label: {
                            Text("Checkout").font(.system(size: 18)).foregroundColor(.white).padding(.vertical,18)
                                .frame(maxWidth:.infinity).background(.blue).cornerRadius(15).shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                        }
                        .padding(.horizontal,25)
                        .padding(.vertical)
                    }
                    .padding(.horizontal, 25)
                }
            }
           
            .navigationBarHidden(true)
            .frame(maxWidth:.infinity, maxHeight: .infinity)
                .background(
                    Color.teal.ignoresSafeArea()
                )
        }
    }
   
//    fuction delete product
    func deleteProduct(product : Product){
        if let index = sharedData.cartProducts.firstIndex(where: {
            currentProduct in
            return product.id == currentProduct.id
            
        }){
            let _ = withAnimation {
                sharedData.cartProducts.remove(at: index)
            }
        }
    }
    
    
}

struct CartPage_Previews: PreviewProvider {
    static var previews: some View {
        CartPage()
    }
}


struct CardView :  View{
    
//    making product is binding so as to update in real time
    @Binding var product :  Product
    
    var body: some View{
        HStack(spacing: 15){
            Image(product.productImage).resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100)
            VStack(alignment:.leading, spacing: 8){
                Text(product.title).font(.system(size: 18, weight: .bold)).lineLimit(1)
                Text(product.subtitle).font(.system(size: 17,weight: .medium)).foregroundColor(.blue)
                
//                quantity button
                HStack(spacing:10){
                 Text("Quantity")
                        .font(.system(size: 14)).foregroundColor(.gray)
                    Button{
                        product.quatity = (product.quatity > 0 ? (product.quatity - 1) : 0)
                    }label: {
                        Image(systemName: "minus").font(.caption).foregroundColor(.white).frame(width:20, height: 20)
                           
                            .background(
                                Color.red
                                    .cornerRadius(4)
                            )
                    }
                    
                    Text("\(product.quatity )")
                        .font(.system(size: 14,weight: .semibold)).foregroundColor(.black)
                    
                    Button{
                        product.quatity += 1
                    }label: {
                        Image(systemName: "plus").font(.caption).foregroundColor(.white).frame(width:20, height: 20)
                            .background(
                                Color.green
                                    .cornerRadius(4)

                            )
                            
                    }
                }
                
            }
        }
        .padding(.horizontal,10)
        .padding(.vertical,10)
        .frame(maxWidth:.infinity, alignment: .leading)
        .background(
            Color.white.cornerRadius(10)
        )
    }
}
