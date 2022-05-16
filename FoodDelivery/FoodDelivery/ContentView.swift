//
//  ContentView.swift
//  FoodDelivery
//
//  Created by gorbyno sitepu on 16/05/22.
//

import SwiftUI

struct ContentView: View {
    @State var search : String = ""
    var body: some View {
        ZStack{
            VStack{
                
//                mark Header
                Header()
                ScrollView(.vertical, showsIndicators: false){
                    
    //                mark search bar
                    Search(search: $search)
    //              mark TopTitle
                    TopTitle()
    //                mark konten food
                    FoodKontent()
    //                mark second title
                    SecondTitle()
    //                mark Icon
                    Category()
    //                mark third title
                    ThirdTitle()
    //                mark second food
                  KontenSecondFood()
                }
            }
        }.background(Color("bg")).edgesIgnoringSafeArea(.all)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Header : View{
    var body: some View{
        HStack{
            VStack(alignment:.leading, spacing: 3){
                Text("Delivery To").font(.system(size: 20,weight: .bold,design: .rounded))
                HStack{
                    Image(systemName: "mappin.circle").foregroundColor(.secondary)
                    Text("Hanoi, Vietnam").font(.system(size: 20, weight: .light,design: .rounded))
                }
            }.padding(.leading,30)
            Spacer()
            Image("bitmap").resizable().frame(width:40, height: 40).aspectRatio(contentMode: .fill).clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 4)).padding(.trailing,30)
        }.padding(.top,50)
    }
    }
}

struct Search : View{
    @Binding var search : String
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 15,style: .continuous).fill(Color.white).frame( height:55)
            HStack{
                Button(action:{}){
                    Image(systemName: "magnifyingglass").frame(width:55, height: 55).foregroundColor(.secondary)
                    TextField("Search for dish or restaurant", text: $search)
                }
               
            }
        }.padding([.leading,.trailing],30).padding(.bottom,10)
    }
}


struct TopTitle : View{
    var body: some View{
        HStack{
            Text("Popular Near You").font(.system(size: 18,weight: .bold,design: .rounded)).padding(.leading,30)
            Spacer()
            Text("View More").font(.system(size: 12, weight: .bold,design: .rounded)).foregroundColor(Color.red).padding(.trailing,30)
        }
    }
}

struct SecondTitle : View{
    var body: some View{
        HStack{
            Text("Explore Category").font(.system(size: 18,weight: .bold,design: .rounded)).padding(.leading,30)
            Spacer()
            Text("Show All ").font(.system(size: 12, weight: .bold,design: .rounded)).foregroundColor(Color.red).padding(.trailing,30)
        }
    }
}


struct ThirdTitle : View{
    var body: some View{
        HStack{
            Text("Recomended").font(.system(size: 18,weight: .bold,design: .rounded)).padding(.leading,30)
            Spacer()
            Text("Show All").font(.system(size: 12, weight: .bold,design: .rounded)).foregroundColor(Color.red).padding(.trailing,30)
        }
    }
}


struct KontenFood : View{
    var image = ""
    var body: some View{
        ZStack{
            VStack(alignment:.leading){
                Image(self.image).resizable().aspectRatio(contentMode: .fill).frame(width:330, height:200).clipped().cornerRadius(15)
                Text("Mc Donald's - Thai Ha").font(.system(size: 18,weight: .bold,design: .rounded))
                Text("Western Cuisine, Fast Food, Burger").font(.system(size: 14,weight: .light,design: .rounded)).foregroundColor(Color.secondary)
                
                HStack{
                    HStack{
                        Image(systemName: "star.fill").resizable().frame(width:20, height: 20).foregroundColor(.orange)
                        Image(systemName: "star.fill").resizable().frame(width:20, height: 20).foregroundColor(.orange)
                        Image(systemName: "star.fill").resizable().frame(width:20, height: 20).foregroundColor(.orange)
                        Image(systemName: "star.fill").resizable().frame(width:20, height: 20).foregroundColor(.orange)
                    }
                    Spacer()
                    HStack{
                        HStack{
                            Image(systemName: "mappin.circle").resizable().frame(width:15, height: 15).foregroundColor(.red).padding(.leading,5)
                            Text("254m").font(.system(size: 12,weight: .medium,design: .rounded)).foregroundColor(.red)
                        }.padding(5).background(Color.secondary).cornerRadius(10)
                        
                        
                        HStack{
                            Image(systemName: "clock").resizable().frame(width:15, height: 15).foregroundColor(.red).padding(.leading,5)
                            Text("27").font(.system(size: 12,weight: .medium,design: .rounded)).foregroundColor(.red)
                        }.padding(5).background(Color.secondary).cornerRadius(10)
                    }
                  
                }
            } .frame(width:330)
        }.padding(15).background(.white).cornerRadius(30)
       
    }
}

struct FoodKontent : View {
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing:20){
                KontenFood(image: "food1")
                KontenFood(image: "food2")
                KontenFood(image: "food3")
            }.padding([.leading,.trailing],30)
        }.padding(.bottom,25)
    }
}

struct Icon : View{
    var body: some View{
        Button(action:{}){
            VStack{
                Image("burger").resizable().frame(width:60, height: 60)
                Text("Food").font(.system(size: 18,weight: .bold,design: .rounded)).foregroundColor(.white)
                Text("2215 Places").font(.system(size: 14,weight: .light,design: .rounded)).foregroundColor(.white)
            }.padding([.leading,.trailing],30).padding([.top,.bottom])
                .background(.red).cornerRadius(15)
        }
     
    }
}

struct Category : View{
    var body: some View{
        ScrollView(.horizontal,showsIndicators: false){
            HStack{
                Icon()
                Icon()
                Icon()
            }.padding([.leading,.trailing],30)
        }

    }
}

struct SecondFood: View{
    var body: some View{
        ZStack{
            VStack(alignment:.leading){
                Image("food1").resizable().aspectRatio(contentMode: .fill).frame(width:200, height:100).clipped().cornerRadius(15)
                Text("Mc Donald's - Thai Ha").font(.system(size: 18,weight: .bold,design: .rounded))
                Text("Western Cuisine, Fast Food, Burger").font(.system(size: 14,weight: .light,design: .rounded)).foregroundColor(Color.secondary)
                
                VStack(alignment:.leading){
                    HStack{
                        Image(systemName: "star.fill").resizable().frame(width:20, height: 20).foregroundColor(.orange)
                        Image(systemName: "star.fill").resizable().frame(width:20, height: 20).foregroundColor(.orange)
                        Image(systemName: "star.fill").resizable().frame(width:20, height: 20).foregroundColor(.orange)
                        Image(systemName: "star.fill").resizable().frame(width:20, height: 20).foregroundColor(.orange)
                    }
                    
                    HStack{
                        HStack{
                            Image(systemName: "mappin.circle").resizable().frame(width:15, height: 15).foregroundColor(.red).padding(.leading,5)
                            Text("254m").font(.system(size: 12,weight: .medium,design: .rounded)).foregroundColor(.red)
                        }.padding(5).background(Color.secondary).cornerRadius(10)
                        
                        
                        HStack{
                            Image(systemName: "clock").resizable().frame(width:15, height: 15).foregroundColor(.red).padding(.leading,5)
                            Text("27").font(.system(size: 12,weight: .medium,design: .rounded)).foregroundColor(.red)
                        }.padding(5).background(Color.secondary).cornerRadius(10)
                    }
                  
                }
            } .frame(width:200)
        }.padding(15).background(.white).cornerRadius(30)
        
    }
}

struct KontenSecondFood : View{
    var body: some View{
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing:20){
                SecondFood()
                SecondFood()
                SecondFood()
            }.padding([.leading,.trailing],30)
        }
    }
}
