//
//  ProductDetailView.swift
//  E-Commerce
//
//  Created by gorbyno sitepu on 19/05/22.
//

import SwiftUI

struct ProductDetailView: View {
    var product : Product
    
//    for matched geometry effect
    var animation :  Namespace.ID
    
//    shared data model
    @EnvironmentObject var sharedData : SharedDataModel
    
    @EnvironmentObject var homeData : HomeViewModel
    
    
    var body: some View {
        VStack{
//            title bar and product image
            VStack{
//                title bar
                HStack{
                    Button{
//                        closing view
                        withAnimation(.easeInOut){
                            sharedData.showDetailProduct = false
                        }
                        
                    }label: {
                        Image(systemName: "arrow.left").font(.title2).foregroundColor(Color.black.opacity(0.7))
                    }
                    
                    Spacer()
                    
                    Button{
                        addToLiked()
                    }label: {
                        Image("heart")
                            .renderingMode(.template)
                            .resizable().aspectRatio(contentMode: .fit)
                            .frame(width:22, height: 22).foregroundColor( isLike() ? .red : Color.black.opacity(0.7))
                    }
                }.padding()
                
//                product Image
                Image(product.productImage)
                    .resizable()
//                    adding matched geometru effect
                    .matchedGeometryEffect(id: "\(product.id)\(sharedData.fromSearchPage ? "SEARCH" : "IMAGE")", in: animation)
                    .aspectRatio(contentMode: .fit).padding(.horizontal).offset(y:-12)
                    .frame(maxHeight: .infinity)
            }
            .frame(height: 800/2.7)
            .zIndex(1)
            
//            product details
            ScrollView(.vertical, showsIndicators: false){
//                product data
                VStack(alignment: .leading, spacing: 15){
                    Text(product.title).font(.system(size: 20, weight: .bold))
                    
                    Text(product.subtitle).font(.system(size: 18, weight: .regular)).foregroundColor(.secondary)
                    
                    Text("Get Apple TV+ free for a year ")
                        .font(.system(size: 16, weight: .bold)).padding(.top)
                    
                    Text("Available when you purchase any new iphone, ipad, ipod Touch, Mac or Apple TV, $4.99/mounth after free trial").font(.system(size: 15)).foregroundColor(.secondary)
                    
                    Button{
                        
                    }label:{
//                        since we need image at right
                        Label{
                            Image(systemName: "arrow.right")
                        }icon:{
                            Text("Full Description")
                        }.font(.system(size:15, weight:.bold)).foregroundColor(Color.blue)
                    }
                    
                    HStack{
                        Text("Total")
                            .font(.system(size:17))
                        Spacer()
                        Text("$357")
                            .font(.system(size:17, weight:.bold)).foregroundColor(Color.blue)
                    }.padding(.vertical,20)
                    
//                    add button
                    
                    Button{
                        addToCart()
                    }label : {
                        Text("\(isAddedToCart() ? "added" : "add" ) to basket")
                            .font(.system(size:20,weight:.bold))
                            .foregroundColor(Color.white)
                            .padding(.vertical, 20)
                            .frame(maxWidth:.infinity)
                            .background(
                                Color.blue
                                    .cornerRadius(15)
                                    .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
                            )
                    }
                    
                }
                .padding([.horizontal, .bottom],20)
                .padding(.top,25)
                .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .leading)
                
            }
            .frame(maxWidth:.infinity, maxHeight: .infinity)
                .background(
                    Color.white
//                corner radius for only top side
                        .clipShape(CustomCorners(corners: [.topLeft,.topRight], radius: 25)).ignoresSafeArea()
                )
                .zIndex(0)
        }
        
        .animation(.easeInOut, value: sharedData.likedProducts)
        .animation(.easeInOut, value: sharedData.cartProducts)
        .background(
            Color.gray.ignoresSafeArea()
        )
    }
    
//    function is like
    func isLike()-> Bool{
        return sharedData.likedProducts.contains { product in
            return self.product.id == product.id
        }
    }
    
//    function added to cart
    func isAddedToCart()-> Bool{
        return sharedData.cartProducts.contains { product in
            return self.product.id == product.id
        }
    }
    
//    fungsi add to liked
    func addToLiked(){
        if let index = sharedData.likedProducts.firstIndex(where: { product in
            return self.product.id == product.id
            
        }){
//            remove from liked
            sharedData.likedProducts.remove(at: index)
        }else{
//            add to like
            sharedData.likedProducts.append(product)
        }
    }
    
//    function add to cart
    func addToCart(){
        if let index = sharedData.cartProducts.firstIndex(where: { product in
            return self.product.id == product.id
            
        }){
//            remove from liked
            sharedData.cartProducts.remove(at: index)
        }else{
//            add to like
            sharedData.cartProducts.append(product)
        }
    }
    
    
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
//        sample product for building preview
//        ProductDetailView(product: HomeViewModel().products[0])
//            .environmentObject(SharedDataModel())
        
        MainPage()
    }
}
