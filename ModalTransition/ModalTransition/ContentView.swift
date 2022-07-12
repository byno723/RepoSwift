//
//  ContentView.swift
//  ModalTransition
//
//  Created by gorbyno sitepu on 07/05/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showModal = false
    
    var body: some View {
        ZStack{
            Image("bg").resizable().ignoresSafeArea()
            
            Button(action:{showModal=true}){
                Text("Click Me").font(.system(size: 40,weight: .heavy,design: .rounded))
                    .foregroundColor(.white)
                    .padding(.vertical,20)
                    .padding(.horizontal,40)
                    .background(Color.black.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }.offset(y:-100)
            
            ModalView(isShowing: $showModal)
            
        }.frame( maxWidth: .infinity, maxHeight: .infinity)
            .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
