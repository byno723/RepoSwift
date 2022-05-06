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
            Text("Hello Ini Konten")
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
        }
    }
}
