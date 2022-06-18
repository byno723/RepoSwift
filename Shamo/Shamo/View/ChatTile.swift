//
//  ChatTile.swift
//  Shamo
//
//  Created by gorbyno sitepu on 31/05/22.
//

import SwiftUI

struct ChatTile: View {
    var body: some View {
        HStack{
            Image("laptop").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).cornerRadius(60)
            VStack(alignment:.leading){
                Text("Store Apple Laptop").font(.system(size: 16,weight: .semibold, design: .rounded )).foregroundColor(.white)
                Text("Good night, This item is ?").font(.system(size: 14)).foregroundColor(.gray)
            }
            Spacer()
            Text("Now").font(.system(.callout))
        }.padding(.horizontal)
    }
}
//
//struct ChatTile_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatTile()
//    }
//}
