//
//  ProductScreen.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import SwiftUI

struct ProductScreen: View {
    @ObservedObject var viewModel : ProductScreenViewModel
    var body: some View {
        ZStack{
            viewModel.onCreateNavigationLinks()
            render()
        }
    }

    private func renderProduct(_ products: ProductsObject)-> some View{
        Button(
            action: {
                viewModel.selectProduct(products)
            },
            label: {
                VStack{
                    ImageView(url: products.imageUrl)
                    TextView(text: products.title, fontsize: 20)
                    TextView(text: "\(products.harga)", fontsize: 16)
                }
            })
       
    }
    
    private func render() -> some View{
        ScrollView{
            ForEach(viewModel.products, id:\.self){
                renderProduct($0)
            }
        }.onAppear(perform: viewModel.loadData)
    }
    
}
