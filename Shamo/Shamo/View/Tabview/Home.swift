//
//  Home.swift
//  Shamo
//
//  Created by gorbyno sitepu on 30/05/22.
//

import SwiftUI

struct Home: View {
    
    @State var selected = tabs[0]
    @Namespace var animation
    
    @State var show = false
    
    var body: some View {
       
        ZStack{
            ScrollView(.vertical, showsIndicators: false){
                
           
            VStack(alignment:.leading){
                // header
                HStack{
                    VStack(alignment:.leading){
                        Text("Halo Gorbyno").font(.system(size: 24, weight: .semibold,design: .rounded)).foregroundColor(Color.white)
                        Text("@byno").font(.system(size: 16)).foregroundColor(Color.gray)
                    }
                    Spacer(minLength: 0)
                    Image("profil").resizable().aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 54, height: 54)
                }.padding(.horizontal)
                    .padding(.top, 20)
                
                
//                    tabs
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(spacing:7){
                        ForEach(tabs,id: \.self){ tab in
    //                            tab button
                            TabButton(title: tab, selected: $selected, animation: animation)
    //                        even spacing
                            if tabs.last != tab{Spacer(minLength: 0)}
                        }
                    }
                    .padding()
                }
                
                VStack{
                    Text("Popular Products").font(.title3).foregroundColor(.white)
                }.padding(.horizontal)
                
                
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        Category()
                        Category()
                        Category()
                        Category()
                       
                    }.padding(.trailing,15)
                 
                }
               
                VStack(alignment:.leading){
                    Text("New Arrivals").font(.title3).foregroundColor(.white)
                    
                    ProductTile()
                    ProductTile()
                }.padding(.horizontal)
                    .padding(.top)
                
  
                Spacer()
            }
            }
        }.padding(.top).background(Color("bgcolor1")).ignoresSafeArea()
    }
}


//Tabs..
var tabs = ["All Shoes", "Running", "Training", "Basket Ball","Hiking"]



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


