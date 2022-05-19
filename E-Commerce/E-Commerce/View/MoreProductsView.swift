//
//  MoreProductsView.swift
//  E-Commerce
//
//  Created by gorbyno sitepu on 18/05/22.
//

import SwiftUI

struct MoreProductsView: View {
    var body: some View {
        VStack{
            Text("More Products").font(.system(size: 24,weight: .bold, design: .rounded)).foregroundColor(.black).frame(maxWidth:.infinity, alignment: .leading)
        }
        .padding()
        .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .topLeading).background(.blue).ignoresSafeArea()
    }
}

struct MoreProductsView_Previews: PreviewProvider {
    static var previews: some View {
        MoreProductsView()
    }
}
