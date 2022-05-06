//
//  ContentView.swift
//  TapGesture
//
//  Created by gorbyno sitepu on 06/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                Feed().padding()
                Spacer()
            }
           
            .navigationBarTitle("Instagram")
        }
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Feed : View{
    @State private var isTapped = false
    
    var body: some View{
        VStack{
            HStack{
                Circle().frame(width:25, height: 25)
                Text("Gorbyno Sitepu")
                Spacer()
                Image(systemName: "circle.grid.2x2")
            }.padding()
            Image("profil").resizable().aspectRatio(contentMode: .fill).frame(height:300).clipped()
            
            HStack{
                if(!self.isTapped){
                    Image(systemName: "heart").resizable().frame(width:25, height: 25)
                        .onTapGesture {
                            if(!self.isTapped)
                            {
                                self.isTapped = true
                            }else{
                                self.isTapped = false
                            }
                        }
                }else{
                    Image(systemName: "heart.fill").resizable().frame(width:25, height: 25)
                        .onTapGesture {
                            if(!self.isTapped)
                            {
                                self.isTapped = true
                            }else{
                                self.isTapped = false
                            }
                        }.foregroundColor(Color.red )
                    
                }
              
                
                Image(systemName: "message").resizable().frame(width:25, height: 25)
                Image(systemName: "paperplane").resizable().frame(width:25, height: 25)
                Spacer()
                Image(systemName: "bookmark").resizable().frame(width:25, height: 25)
                
            }.padding()
        }.border(Color.gray)
    }
}
