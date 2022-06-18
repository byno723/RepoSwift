//
//  ContentView.swift
//  YTAPP
//
//  Created by gorbyno sitepu on 06/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        bottom tab
        ZStack{
            TabView{
                Home()
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Beranda")
                }
                Register()
                .tabItem{
                    Image(systemName: "paperplane.fill")
                    Text("Explorasi")
                }
                Home()
                .tabItem{
                    Image(systemName: "tray.fill")
                    Text("Subscription")
                }
                Home()
                .tabItem{
                    Image(systemName: "envelope.fill")
                    Text("Kotak Masuk")
                }
                Home()
                .tabItem{
                    Image(systemName: "play.rectangle.fill")
                    Text("Koleksi")
                }
               
            }.accentColor(.red)
        }

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
           cellKontent(imageKonten: "naruto", profilkonten: "profil", judul: "Naruto Shippuden", deskripsi: "Text ini adalah deskripsi -300x ditonton - 9 jam yang lalu", durasi: "10:10")
            cellKontent(imageKonten: "naruto", profilkonten: "profil", judul: "Naruto Shippuden", deskripsi: "Text ini adalah deskripsi -300x ditonton - 9 jam yang lalu", durasi: "10:10")
        }
    }
}


//komponen
struct cellKontent : View{
    
    var imageKonten :  String
    var profilkonten : String
    var judul : String
    var deskripsi : String
    var durasi : String
    
    var body: some View{
        VStack{
            ZStack(alignment:.bottomTrailing){
                Image(imageKonten).resizable().aspectRatio(contentMode: .fill)
                
                Text(durasi).padding(.all, 5)
                    .foregroundColor(Color.white)
                    .font(.caption)
                    .background(Color.black)
                    .cornerRadius(5)
                    .padding(.trailing,5)
                    .padding(.bottom,5)
            }
            HStack(spacing:10){
                Image(profilkonten).resizable().frame(width:30, height: 30).clipShape(Circle())
                VStack(alignment:.leading){
                    Text(judul).font(.headline)
                    HStack{
                        Text(deskripsi).font(.caption)
                    }
                }
                Spacer()
                Image(systemName: "list.bullet")
            }
        }
    }
}
