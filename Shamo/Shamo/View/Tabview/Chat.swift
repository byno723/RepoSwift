//
//  Chat.swift
//  Shamo
//
//  Created by gorbyno sitepu on 30/05/22.
//

import SwiftUI

struct Chat: View {
    var body: some View {
        ZStack{
            NavigationView{
                ScrollView{
                    ChatTile()
                    ChatTile()
                }.background(Color("bgcolor1"))
                    .navigationBarTitle(Text("Message Support"))
            }
        }
            
    }
}

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        Chat()
    }
}
