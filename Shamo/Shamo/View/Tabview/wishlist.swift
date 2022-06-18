//
//  wishlist.swift
//  Shamo
//
//  Created by gorbyno sitepu on 30/05/22.
//

import SwiftUI

struct wishlist: View {
    var body: some View {
        NavigationView{
            ScrollView{
                WishlistCard()
                WishlistCard()
                WishlistCard()
            }.background(Color("bgcolor1"))
            
            .navigationBarTitle("Favorite")
        }
    }
}

struct wishlist_Previews: PreviewProvider {
    static var previews: some View {
        wishlist()
    }
}
