//
//  MainPage.swift
//  E-Commerce
//
//  Created by gorbyno sitepu on 17/05/22.
//

import SwiftUI

struct MainPage: View {
//    current tab
    @State var currentTab : Tab = .Home
    
    @StateObject var sharedData :  SharedDataModel = SharedDataModel()
    
//    animation Namespace
    @Namespace var animation
    
    
//    hiding tab bar
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        VStack{
//            tab View ..
            
            TabView(selection: $currentTab){
                
              Home(animation: animation)
                    .environmentObject(sharedData)
                    .tag(Tab.Home)
                
                LikedPage()
                    .environmentObject(sharedData)
                    .tag(Tab.Liked)
                
                ProfilePage()
                    .tag(Tab.Profile)
                
               CartPage()
                    .environmentObject(sharedData)
                    .tag(Tab.Cart)
            }
//            Custume tab bar
            HStack{
                ForEach(Tab.allCases,id: \.self){tab in
                    Button{
//                        updating tab
                        currentTab = tab
                        
                    }label: {
                        Image(tab.rawValue).resizable().renderingMode(.template).aspectRatio(contentMode: .fit).frame(width:22, height: 22)
//                        applying little shadow
                            .background(
                                Color.blue.opacity(0.1).cornerRadius(5)
//                                blurring
                                    .blur(radius: 5)
//                                making little big
                                    .padding(-7).opacity(currentTab == tab ? 1 : 0)
                                
                            )
                            .frame(maxWidth:.infinity)
                            .foregroundColor(currentTab==tab ? Color.blue : Color.black.opacity(0.3))
                    }
                }
            }.padding([.horizontal, .bottom])
                .padding(.bottom,10)
        }
        .background(Color.teal).ignoresSafeArea()
        
        .overlay(
            ZStack{
//                detail page
                if let product = sharedData.detailProduct, sharedData.showDetailProduct{
                    
                    ProductDetailView(product: product, animation: animation).environmentObject(sharedData)
//                        adding transition
//                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                }
            }
        )
       
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

//making case Iteratable
//tab cases
enum Tab: String, CaseIterable{
    case Home = "home"
    case Liked = "heart"
    case Profile = "person"
    case Cart = "cart"
}
