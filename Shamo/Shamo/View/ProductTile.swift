//
//  ProductTile.swift
//  Shamo
//
//  Created by gorbyno sitepu on 30/05/22.
//

import SwiftUI

struct ProductTile: View {
    var body: some View {
            HStack{
                Image("laptop").resizable().aspectRatio(contentMode: .fill).frame(width: 80, height: 80)
                VStack(alignment:.leading){
                    Text("Laptop Apple").font(.system(size: 16,weight: .medium, design: .rounded)).foregroundColor(.white)
                    Text("$73").font(.system(size: 14, weight: .bold)).foregroundColor(Color("pricetext"))
                }
            }
        
    }
}

//struct ProductTile_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductTile()
//    }
//}
