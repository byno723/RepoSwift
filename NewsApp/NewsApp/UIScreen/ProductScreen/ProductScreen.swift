//
//  ProductScreen.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import SwiftUI

struct ProductScreen: View {
    var body: some View {
        ZStack{
            render()
        }
    }

    private func renderProduct()-> some View{
        VStack{
            ImageView(url: "fd")
            TextView(text: "tavd", fontsize: 20)
            TextView(text: "dsnhbd", fontsize: 16)
        }
    }
    
    private func render() -> some View{
        ScrollView{
            ForEach(1...5, id:\.self){_ in
                renderProduct()
            }
        }
    }
    
}
