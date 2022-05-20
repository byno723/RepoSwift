//
//  SearchView.swift
//  E-Commerce
//
//  Created by gorbyno sitepu on 18/05/22.
//

import SwiftUI

struct SearchView: View {
    
    var animation : Namespace.ID
    
//    shared data
    @EnvironmentObject var sharedData: SharedDataModel
    
    @EnvironmentObject var homeData : HomeViewModel
//    Activating text field with the help of focusstate
    @FocusState var startTF : Bool
    
    var body: some View {
        VStack(spacing:0){
//            search bar
            HStack(spacing:20){
//                close button
                Button{
                    withAnimation{
                        homeData.searchActivated = false
                    }
                    homeData.searchText = ""
//                    resseting ...
                    sharedData.fromSearchPage = false
                }label: {
                    Image(systemName: "arrow.left").font(.title2).foregroundColor(Color.black.opacity(0.7))
                }
                
//                search bar
                HStack{
                    Image(systemName: "magnifyingglass").font(.title2).foregroundColor(.gray)
                  
        //                    since we need a separate view for search bar..
                    TextField("Search", text: $homeData.searchText).textCase(.lowercase)
                        .disableAutocorrection(true).focused($startTF)
                    
                }.padding(.vertical,12).padding(.horizontal)
                    .background(
                        Capsule().strokeBorder(Color.purple,lineWidth: 1.5)
                    )
                    .matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                    .padding(.trailing,20)
                
                
            }
            .padding([.horizontal])
            .padding(.top).padding(.bottom,10)
            
//            filter results..
//            showing progress if searching
//            else showing no results found empty
            if let products = homeData.searchProducts{
                if products.isEmpty{
//                    no result found
                    VStack(spacing:10){
                        Image("noresult").resizable().aspectRatio(contentMode: .fit).padding(.top,60)
                        Text("Item Not Found").font(.system(size: 22,weight: .bold))
                        Text("Try a more generic search term or try looking for alternative products.").font(.system(size: 22)).foregroundColor(.white).multilineTextAlignment(.center)
                            .padding(.horizontal, 30)
                    }
                    .padding()
                    
                }else{
                    ScrollView(.vertical, showsIndicators: false){
        //                staggered grid
                        VStack(spacing: 0){
        //                    found text
                            Text("Found \(products.count) results").font(.system(size: 24,weight: .bold,design: .rounded)).padding(.vertical)
                            StaggeredView(columns: 2,spacing: 20, list: products){ product in
            //                    card view
                                ProductCardView(product: product)
                            }
                        }
                        .padding()
                    }
                }
            }else{
                ProgressView().padding(.top,30).opacity(homeData.searchText == "" ? 0 : 1)
            }
         
            
        }.frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
            .background(
                Color.teal.ignoresSafeArea()
            )
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                    startTF = true
                }
            }
     
    }
    
    
    
//    product card view
    @ViewBuilder
    func ProductCardView(product : Product)->some View{
        VStack(spacing:10){
            
            ZStack{
                if sharedData.showDetailProduct{
                    Image(product.productImage).resizable().aspectRatio(contentMode: .fit).opacity(0)
                }else{
                    Image(product.productImage).resizable().aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "\(product.id)SEARCH", in: animation)
                }
            }
          
//            moving image to top to look like its fixed at half top
                .offset(y:-50)
                .padding(.bottom,-50)
            
            Text(product.title).font(.system(size: 18,weight: .medium, design: .rounded)).padding(.top)
            
            Text(product.subtitle).font(.system(size: 14,weight: .regular, design: .rounded)).padding(.top).foregroundColor(.gray)
            
            Text(product.price).font(.system(size: 16,weight: .bold, design: .rounded)).padding(.top,5).foregroundColor(.blue)
            
        }
        .padding(.horizontal,28).padding(.bottom,22)
        .background(
            Color.white.cornerRadius(25)
        ).padding(.top,50)
        
//        showing product detail when tapped
        .onTapGesture {
            withAnimation(.easeInOut){
                sharedData.detailProduct = product
                sharedData.showDetailProduct = true
            }
        }
        
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
       MainPage()
    }
}
