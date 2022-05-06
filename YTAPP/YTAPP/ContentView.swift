//
//  ContentView.swift
//  YTAPP
//
//  Created by gorbyno sitepu on 06/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home : View{
    var body: some View{
        NavigationView{
          
            konten()
            
                .navigationBarItems(leading: HStack{
                    Button(action:{print("ok")}){
                        Image("youtube").renderingMode(.original).resizable()
                        .frame(width:90, height: 50)                    }
                  
                }, trailing:
                    HStack{
                    Button(action:{}){
                        Image(systemName: "tray.fill")
                            .foregroundColor(Color.secondary)
                    }
                    Button(action:{}){
                        Image(systemName: "video.fill")
                            .foregroundColor(Color.secondary)
                    }
                    Button(action:{}){
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.secondary)
                    }
                    Button(action:{}){
                        Image("profil").resizable().frame(width:30, height: 30).clipShape(Circle())
                    }
                    
                }
            )
                .navigationBarTitle("", displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
       
    }
    
}

struct konten :View{
    var body: some View{
        List{
            ZStack(alignment:.bottomTrailing){
                Image("naruto").resizable().aspectRatio(contentMode: .fill)
                
                Text("10:00").padding(.all, 5)
                    .foregroundColor(Color.white)
                    .font(.caption)
                    .background(Color.black)
                    .cornerRadius(5)
                    .padding(.trailing,5)
                    .padding(.bottom,5)
            }
            HStack(spacing:10){
                Image("profil").resizable().frame(width:30, height: 30).clipShape(Circle())
                VStack(alignment:.leading){
                    Text("Naruto Shippuden #1").font(.headline)
                    HStack{
                        Text("Text ini adalah deskripsi -300x ditonton - 9 jam yang lalu").font(.caption)
                    }
                }
                Spacer()
                Image(systemName: "list.bullet")
            }
        }
    }
}
