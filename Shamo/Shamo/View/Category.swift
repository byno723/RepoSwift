//
//  ProductTile.swift
//  Shamo
//
//  Created by gorbyno sitepu on 30/05/22.
//

import SwiftUI

struct Category: View {
    var body: some View {
        ZStack{
            VStack(alignment:.leading){
                Image("laptop").resizable().aspectRatio(contentMode: .fill).frame(width: 120, height: 120)
                Text("Laptop Apple").font(.system(size: 16,weight: .medium, design: .rounded)).padding(.bottom,2)
                Text("$73").font(.system(size: 14, weight: .bold)).foregroundColor(Color("pricetext"))
            }.padding().background(Color.secondary).cornerRadius(15)
        }.padding(.leading, 15)
    }
}
//
//struct Category_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductTile()
//    }
//}
