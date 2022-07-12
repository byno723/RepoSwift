//
//  DetailScreen.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import Foundation
import SwiftUI

struct DetailScreen: View{
//    @Binding var navigationSelection : String?
    @ObservedObject var viewModel : DetailScreenViewModel 
   
    
    var body: some View{
        ZStack{
            viewModel.onCreateNavigationLinks()
            render()
        }
    }
  
    private func render()-> some View{
        VStack{
            ScrollView{
                ImageView(url: viewModel.dataDetailNews.urlToImage)
                VStack{
                    TextView(text: viewModel.dataDetailNews.title, fontsize: 30)
                    TextView(text: viewModel.dataDetailNews.description, fontsize: 20)
                }
                .padding([.horizontal,.vertical], 20)
            }
            ButtonView(
                action: viewModel.onNext,
                text: "Next"
            )
        }.onAppear(perform: viewModel.loadData)
       
      
    }
}
