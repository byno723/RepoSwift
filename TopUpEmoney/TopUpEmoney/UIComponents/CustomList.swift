//
//  CustomList.swift
//  TopUpEmoney
//
//  Created by gorbyno sitepu on 24/06/22.
//

import SwiftUI

struct CustomList: View {
    var title : String = ""
    var subtitle : String = ""
    var body: some View {
        HStack{
            Text(title)
                .fontWeight(.medium)
            Spacer()
            Text(subtitle)
                .font(.system(size: 14))
                .fontWeight(.regular)
        }.padding(.top,10)
    }
}
