//
//  ContentView.swift
//  SnapFood
//
//  Created by gorbyno sitepu on 07/05/22.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = 1
    @State var selectedTabBottom =  1
    
    var body: some View {
        ZStack{
            VStack{
    //            mark  : Head Title
                HeadTitle()
    //            mark: TopTabs
                Toptabs(selectedTab: self.$selectedTab)
//                mark : scrool foo
                ScrollFood()
                Spacer()
               Bottomtabs(selectedTabBottom: $selectedTabBottom)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeadTitle : View{
    var body: some View{
        HStack{
            Text("Favourite").font(.system(size: 28, weight: .semibold, design: .default))
            Spacer()
        }.padding([.leading, .trailing], 30).padding(.bottom,40)
    }
}

struct Toptabs : View{
    @Binding var selectedTab : Int
    
    var body: some View{
        VStack{
            VStack{
                HStack(spacing:0){
//                        mark : tabs 1
                    VStack{
                        Button(action : {
                            self.selectedTab = 1
                        }){
                            Text("All").font(.headline).foregroundColor(selectedTab==1 ? Color.green : Color.secondary)
                        }
                        Rectangle().fill(Color.green).frame(height:5).opacity(selectedTab == 1 ? 100 : 0 )
                    }.frame(height:20)
                    
//                        mark  : tabs 2
                    VStack{
                        Button(action : {
                            self.selectedTab = 2
                        }){
                            Text("Cookbooks").font(.headline).foregroundColor(selectedTab==2 ? Color.green : Color.secondary)
                        }
                        Rectangle().fill(Color.green).frame(height:5).opacity(selectedTab == 2 ? 100 : 0 )
                    }.frame(height:20)
                    
                    
//                        mark  : tabs 3
                    VStack{
                        Button(action : {
                            self.selectedTab = 3
                        }){
                            Text("Recently").font(.headline).foregroundColor(selectedTab==3 ? Color.green : Color.secondary)
                        }
                        Rectangle().fill(Color.green).frame(height:5).opacity(selectedTab == 3 ? 100 : 0 )
                    }.frame(height:20)
                    
                    
                    
                }
            }.padding(.bottom, 10).padding(.top,30).border(Color("secondary"),width: 1)
        }.padding(.bottom,5)
    }
}

struct FoodComp : View{
    var imgFood : String = ""
    var foodTitle : String
    var foodChef : String
    
    var body: some View{
        VStack{
            Image(imgFood).resizable().aspectRatio(contentMode: .fill).frame(height:200).cornerRadius(20).clipped()
            HStack{
                Text("50 min").font(.headline)
                Text("234 cal").font(.headline)
                HStack{
                    Text("Rating").font(.headline)
                    HStack{
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                    }
                   
                }
                Spacer()
            }.frame(height:30)
            HStack{
                Image("bitmap").resizable().aspectRatio(contentMode: .fill).frame(width:40, height: 40).clipShape(Circle())
                VStack(alignment:.leading){
                    Text(foodTitle).font(.system(size: 20,weight: .bold,design: .rounded))
                    Text(foodChef).font(.system(size: 14,weight: .bold, design: .rounded)).foregroundColor(Color.secondary)
                    
                }
                Spacer()
            }
        }.padding(.bottom,30)
    }
}

struct ScrollFood : View{
    var body: some View{
        ScrollView(.vertical, showsIndicators: false){
            VStack{
//                        mark: Food Comp
             FoodComp(imgFood: "deesert4", foodTitle: "Ice Cream", foodChef: "Chef Byno")
                FoodComp(imgFood: "deesert1", foodTitle: "Ice Cream", foodChef: "Chef Byno")
                FoodComp(imgFood: "deesert1", foodTitle: "Ice Cream", foodChef: "Chef Byno")
            }.padding([.leading,.trailing],10).padding(.bottom,20)
        }
    }
}

struct Bottomtabs: View{
    @Binding var selectedTabBottom : Int
    var body: some View{
        
        HStack{
            VStack{
                Button(action:{}){
                    VStack{
                        Image(systemName: "heart.fill").resizable().frame(width:25, height: 23).foregroundColor(self.selectedTabBottom == 1 ? Color.green : Color.secondary)
                        Text("Favorite").font(.system(size: 9,weight: .medium, design: .default)).foregroundColor(self.selectedTabBottom == 1 ? Color.green : Color.secondary)
                    }
                }
            }
            Spacer()
            VStack{
                Button(action:{}){
                    VStack{
                        Image(systemName: "magnifyingglass").resizable().frame(width:25, height: 23).foregroundColor(self.selectedTabBottom == 2 ? Color.green : Color.secondary)
                        Text("Favorite").font(.system(size: 9,weight: .medium, design: .default)).foregroundColor(self.selectedTabBottom == 2 ? Color.green : Color.secondary)
                    }
                }
            }
            Spacer()
            VStack{
                Button(action:{}){
                    VStack{
                        Image(systemName: "camera").resizable().frame(width:25, height: 23).foregroundColor(self.selectedTabBottom == 3 ? Color.green : Color.secondary)
                        Text("Photo").font(.system(size: 9,weight: .medium, design: .default)).foregroundColor(self.selectedTabBottom == 3 ? Color.green : Color.secondary)
                    }
                }
            }
            Spacer()
            VStack{
                Button(action:{}){
                    VStack{
                        Image(systemName: "cart").resizable().frame(width:25, height: 23).foregroundColor(self.selectedTabBottom == 4 ? Color.green : Color.secondary)
                        Text("Shopping").font(.system(size: 9,weight: .medium, design: .default)).foregroundColor(self.selectedTabBottom == 4 ? Color.green : Color.secondary)
                    }
                }
            }
            Spacer()
            
            VStack{
                Button(action:{}){
                    VStack{
                        Image(systemName: "person").resizable().frame(width:25, height: 23).foregroundColor(self.selectedTabBottom == 5 ? Color.green : Color.secondary)
                        Text("User").font(.system(size: 9,weight: .medium, design: .default)).foregroundColor(self.selectedTabBottom == 5 ? Color.green : Color.secondary)
                    }
                }
            }
        }.padding([.leading,.trailing],30)
    }
}
