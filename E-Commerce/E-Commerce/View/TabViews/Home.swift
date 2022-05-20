//
//  Home.swift
//  E-Commerce
//
//  Created by gorbyno sitepu on 17/05/22.
//

import SwiftUI

struct Home: View {
    var animation: Namespace.ID
    
//    shared data
    @EnvironmentObject var sharedData : SharedDataModel
    
    @StateObject var homeData : HomeViewModel = HomeViewModel()
  
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing:15){
//                search bar
               
                ZStack{
                    if homeData.searchActivated{
                        SearchBar()
                    }else{
                        SearchBar().matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                    }
                }
                .frame(width:500 / 1.6)
                .padding(.horizontal,25)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeInOut){
                        homeData.searchActivated = true
                    }
                }
                
                Text("Order online \ncollect in store").font(.system(size: 28,weight: .bold,design: .rounded))
                    .frame(maxWidth:.infinity, alignment: .leading).padding(.top).padding(.horizontal,25)
                
//                product Tab
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing:18){
                        ForEach(ProductType.allCases, id: \.self){ type in
//                            product type view
                            ProductTypeView(type: type)
                        }
                    }
                    .padding(.horizontal,25)
                }.padding(.top,28)
                
                
//                product page
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing:25){
                        ForEach(homeData.filteredProducts){product in
//                            product card view
                            ProductCardView(product: product)
                        }
                    }.padding(.horizontal,25)
                        .padding(.bottom)
                        .padding(.top,70)
                }.padding(.top,30)
                
            }.padding(.vertical)
//            see more Button
//            this buton will show all products on the current product type
//            since here were only showing only 4
            
            Button{
                homeData.showMoreProductsOnType.toggle()
            }label: {
                Label{
                    Image(systemName: "arrow.right")
                }icon: {
                   Text("See more")
                }.font(.system(size: 15,weight: .bold,design: .rounded)).foregroundColor(.blue)
            }.frame(maxWidth:.infinity, alignment: .trailing).padding(.trailing).padding(.top,10)
            
            
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity).background(Color.teal)
        
//        updating data whenever tab changes
        .onChange(of: homeData.productType){newValue in
            homeData.filterProductByType()
            
        }
        
//        modal
        .sheet(isPresented: $homeData.showMoreProductsOnType){
            
        }content :{
            MoreProductsView()
        }
        
//        displaying search view
        .overlay(
            ZStack{
                if homeData.searchActivated{
                    SearchView(animation: animation).environmentObject(homeData)
                }
            }
        )
    }
    
//    since we're adding matched geometry effect
//    avoiding code replication
//    search bar
    @ViewBuilder
    func SearchBar() -> some View{
        HStack{
            Image(systemName: "magnifyingglass").font(.title2).foregroundColor(.gray)
          
//                    since we need a separate view for search bar..
            TextField("Search", text: .constant("")).disabled(true)
            
        }.padding(.vertical,12).padding(.horizontal)
            .background(
                Capsule().strokeBorder(Color.gray,lineWidth: 0.8)
            )
          
            
    }
    
//    product card view
    @ViewBuilder
    func ProductCardView(product : Product)->some View{
        VStack(spacing:10){
           
//            adding matched geometry effect
            ZStack{
                if sharedData.showDetailProduct{
                    Image(product.productImage).resizable().aspectRatio(contentMode: .fit)
                        .opacity(0)
                }else{
                    Image(product.productImage).resizable().aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "\(product.id)IMAGE", in: animation)
                }
            }
            
            
            .frame(width: 400/2.5, height: 400/2.5)
//            moving image to top to look like its fixed at half top
                .offset(y:-80)
                .padding(.bottom,-80)
            
            Text(product.title).font(.system(size: 18,weight: .medium, design: .rounded)).padding(.top)
            
            Text(product.subtitle).font(.system(size: 14,weight: .regular, design: .rounded)).padding(.top).foregroundColor(.gray)
            
            Text(product.price).font(.system(size: 16,weight: .bold, design: .rounded)).padding(.top,5).foregroundColor(.blue)
            
        }
        .padding(.horizontal,28).padding(.bottom,22)
        .background(
            Color.white.cornerRadius(25)
        )
//        showing product detail when tapped
        .onTapGesture {
            withAnimation(.easeInOut){
                sharedData.detailProduct = product
                sharedData.showDetailProduct = true
            }
        }
    }
    
    
//    product type view
    @ViewBuilder
    func ProductTypeView(type : ProductType)-> some View{
        Button{
//            updating current type
            withAnimation{
                homeData.productType = type
            }
        }label: {
            Text(type.rawValue)
                .font(.system(size: 15,weight: .medium,design: .rounded))
//            changing color based on current product type
                .foregroundColor(homeData.productType == type ? Color.blue : Color.gray)
                .padding(.bottom,10)
            
//            adding Indicator at bottom
                .overlay(
//                    adding matched geometric Effects
                    
                    ZStack{
                        if homeData.productType == type{
                            Capsule().fill(Color.blue).frame(height:2)
                                .matchedGeometryEffect(id: "PRODUCTTAB", in: animation)
                        }else{
                            Capsule().fill(Color.clear).frame(height:2)
                        }
                    }.padding(.horizontal,5)
                    ,alignment: .bottom
                )
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
