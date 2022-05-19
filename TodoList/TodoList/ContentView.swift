//
//  ContentView.swift
//  TodoList
//
//  Created by gorbyno sitepu on 16/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
//            mark kontent
           konten()
//            mark title
                .navigationBarItems(leading: Text("My Tasks").font(.system(size: 20,weight: .bold,design: .rounded)), trailing: Button(action:{}){
                    Image(systemName: "square.and.pencil")
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct konten : View{
    var body: some View{
        ZStack{
            ZStack{
                HStack(alignment:.center,spacing:30){
                    
                    Text("Low").font(.system(size: 16,weight: .bold,design: .rounded)).padding(5).background(.secondary).cornerRadius(4)
                    Text("Moderate").font(.system(size: 16,weight: .bold,design: .rounded))
                    Text("Medium").font(.system(size: 16,weight: .bold,design: .rounded))
                    Text("High").font(.system(size: 16,weight: .bold,design: .rounded))
                }
            }.padding(5).background().cornerRadius(5)
        }.padding().background(.cyan).cornerRadius(10)
       
    }
}
