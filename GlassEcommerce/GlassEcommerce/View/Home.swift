//
//  Home.swift
//  GlassEcommerce
//
//  Created by gorbyno sitepu on 24/05/22.
//

import SwiftUI

struct Home: View {
    
    @State var selected = tabs[0]
    @Namespace var animation
    
    @State var show = false
    @State var selectedItem : Item = items[0]
    
    var body: some View {
        ZStack{
            
            VStack{
    //            header
                HStack{
                    Button(action:{}){
                        Image(systemName: "line.horizontal.3.decrease")
                            .font(.system(size: 25, weight: .bold, design: .rounded)).foregroundColor(.black)
                    }
                    Spacer(minLength: 0)
                    
                    Button(action:{}){
                        Image("naruto")
                            .resizable().aspectRatio(contentMode: .fill)
                            .frame(width: 45, height: 45).cornerRadius(15)
                    }
                }
                .padding(.vertical,10)
                .padding(.horizontal)
             
                ScrollView{
                    VStack{
            //            title started
                        HStack{
                            VStack(alignment:.leading, spacing: 5){
                                Text("Let's").font(.title).foregroundColor(.black)
                                Text("Get Started").font(.largeTitle).fontWeight(.heavy).foregroundColor(.black)
                            }
                            .padding(.horizontal)
                            Spacer(minLength: 0)
                        }
                        
    //                    tabs
                        HStack(spacing:0){
                            ForEach(tabs,id: \.self){ tab in
    //                            tab button
                                TabButton(title: tab, selected: $selected, animation: animation)
        //                        even spacing
                                if tabs.last != tab{Spacer(minLength: 0)}
                            }
                        }
                        .padding()
                        .padding(.top,5)
                        
                        
    //                    item
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 25){
                            ForEach(items){item in
    //                            card view
                                CardView(item: item, animation: animation)
                                    .onTapGesture {
                                        withAnimation(.spring()){
                                            selectedItem = item
                                            show.toggle()
                                        }
                                    }
                            }
                        }.padding()
                    }
                }
                
                Spacer(minLength: 0)
            }
            .opacity(show ? 0 : 1)
            
            if show{
                Detail(selectedItem: $selectedItem, show: $show, animation: animation)
            }
            
        }
       
        .background(Color.white.ignoresSafeArea())
    }
}

//Tabs..
var tabs = ["Glasses", "Watched", "Shoes", "Parfume"]

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
