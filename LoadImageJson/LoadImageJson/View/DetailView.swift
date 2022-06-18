//
//  DetailView.swift
//  LoadImageJson
//
//  Created by gorbyno sitepu on 26/05/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    @EnvironmentObject var News : NewsModels
    
//    @ObservedObject var News = NewsModels()
    let item : News
    
    var animation : Namespace.ID
    
    
  
    var body: some View {
        ScrollView{
            VStack(alignment:.leading){
                
                VStack{
                  
                    WebImage(url: URL(string: item.image)).resizable().frame(width: .infinity, height: 300)
                        .aspectRatio(contentMode: .fit)
//                        .matchedGeometryEffect(id: "image\(item.id)", in: animation)
                        .padding()
                    
                }.padding(.bottom,30)
                
                
                Text(item.title).font(.largeTitle).fontWeight(.bold).padding(.bottom)
                Text(item.description).font(.caption)
                
                Spacer()
            }.padding()
        }
      
       
        
    }
}
//
//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
