//
//  CheckOutScreen.swift
//  NewsApp
//
//  Created by Gorbyno S on 14/07/22.
//

import SwiftUI

struct CheckOutScreen: View {
    @ObservedObject var viewModel : CheckoutScreenViewModel
   
    var body: some View {
        ZStack{
            viewModel.onCreateNavigationLinks()
            render()
        }
    }
    private func buttonSubmit() -> some View{
        ButtonView(
            action: {
                viewModel.submitData()
            },
            text: "Submit")
    }
    private func render() -> some View{
        VStack{
            ImageView(url: viewModel.product.imageUrl)
            TextView(text: viewModel.product.title, fontsize: 20)
            TextView(text: "\(viewModel.product.harga)", fontsize: 14)
            TextfieldView(text: "", placeholder: "Amount")
            buttonSubmit()
        }.padding(.all, 20)
            .onAppear(perform: viewModel.loadData)
    }
    
   
}
