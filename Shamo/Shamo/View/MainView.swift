//
//  MainView.swift
//  Shamo
//
//  Created by gorbyno sitepu on 30/05/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack{
            TabView{
                Home()
                .tabItem{
                    Image(systemName: "house.fill")
//                    Text("Home")
                }
                
                
                Chat()
                .tabItem{
                    Image(systemName: "message.fill")
//                    Text("Chat")
                }
                
                
                wishlist()
                .tabItem{
                    Image(systemName: "heart")
//                    Text("Chat")
                }
                
                Cart()
                
                .tabItem{
                    Image(systemName: "bag")
//                    Text("Cart")
                }
                
                Profile()
                .tabItem{
                    Image(systemName: "person")
//                    Text("Chat")
                }
               
               
               
            }.accentColor(Color("primarycolor"))
               
        }
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
