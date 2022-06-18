//
//  ContentView.swift
//  LoadImageJson
//
//  Created by gorbyno sitepu on 20/05/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    
    var body: some View {
        NavigationView{
            Home()
                .navigationTitle("News")
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home : View{
    @EnvironmentObject var News : NewsModels
    
    @Namespace var animation
    
//    @ObservedObject var News = NewsModels()
    
    var body: some View{
        List(News.data){ i in
            NavigationLink(destination: DetailView(item : i, animation: animation),
            label: {
                HStack{
                    if i.image != "" {
                        WebImage(url: URL(string: i.image))
                            .resizable().scaledToFill()
                            
                            .frame(width:120, height: 170)
                            .matchedGeometryEffect(id: "image\(i.id)", in: animation)
                            .background(Color.secondary)
                            .cornerRadius(10)
                    }else{
                        Image("loader").resizable().frame(width: 120, height: 170).cornerRadius(10)
                    }
                    
                    VStack(alignment:.leading, spacing: 10){
                        Text(i.title).fontWeight(.bold)
                        Text(i.description).font(.caption).lineLimit(4).multilineTextAlignment(.leading)
                    }
                }
            })
          
        }
    }
}
