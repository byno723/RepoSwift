//
//  WishlistCard.swift
//  Shamo
//
//  Created by gorbyno sitepu on 31/05/22.
//

import SwiftUI

struct WishlistCard: View {
    var body: some View {
        HStack{
            Image("profil").resizable().aspectRatio(contentMode: .fill).frame(width: 60, height: 60).cornerRadius(12)
            VStack(alignment:.leading){
                Text("Laptop Apple").font(.system(size: 16, weight: .semibold, design: .rounded)).foregroundColor(.white)
                Text("$239").foregroundColor(Color("pricetext"))
            }
            Spacer()
            Image(systemName: "heart.fill").foregroundColor(.red)
        }.padding(.horizontal)
    }
}
//
//struct WishlistCard_Previews: PreviewProvider {
//    static var previews: some View {
//        WishlistCard()
//    }
//}
