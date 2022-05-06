//
//  ContentView.swift
//  DragGesture
//
//  Created by gorbyno sitepu on 06/05/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @State private var offset = CGSize.zero
    
    var body: some View {
        
        let drag = DragGesture()
            .onChanged{
                gesture in
                self.offset = gesture.translation
            }.onEnded{
                value in
                self.offset = CGSize.zero
                self.showMenu = false
            }
        
       return ZStack{
            Color.orange.edgesIgnoringSafeArea(.all)
            VStack{
                Image("logo").resizable().frame(width:300, height: 300)
                Button(action:{
                    withAnimation{
                        self.showMenu.toggle()
                    }
                }){
                    Text("Promo Merdeka").padding().background(Color.green).cornerRadius(10).foregroundColor(Color.white)
                }
            }
            if self.showMenu {
                Kupon().transition(.move(edge: .bottom)).animation(.default)
                    .offset(y:self.offset.height)
                    .gesture(drag)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Kupon : View{
    var body: some View{
        VStack{
            Text("Selamat Anda menang ").font(.largeTitle).bold()
            .foregroundColor(Color.white)
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.red)
            .cornerRadius(20)
            .edgesIgnoringSafeArea(.bottom)
    }
}
