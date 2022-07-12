//
//  ContentView.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import SwiftUI


struct HomeScreen: View {
    
    @ObservedObject var viewModel : HomeScreenViewModel = HomeScreenViewModel()
    
    var body: some View {
        ZStack{
            renderNav()
            render()
        }
    }
    private func renderNav()-> some View {
        NavigationLink(
            destination: DetailScreen(
                viewModel: DetailScreenViewModel(
                    dataDetailNews: viewModel.selectedNews
                )
            ),
            tag: ScreenName.detailScreen.rawValue,
            selection: $viewModel.navigationSelection)
        {EmptyView()}
    }
    
    private func renderNews(_ news : NewsObject)-> some View{
     
        Button {
            viewModel.selectedNews = news
            print(viewModel.selectedNews.title)
            viewModel.navigationSelection = ScreenName.detailScreen.rawValue
        } label: {
            
            VStack{
                ImageView(url: news.urlToImage)
                TextView(text: news.title, fontsize: 20)
                TextView(text: news.description, fontsize: 14)
            }
        }

    }
    private func render()-> some View{
        ScrollView{
            LazyVStack(spacing:20){
                ForEach(viewModel.newsList, id:\.self){
                    renderNews($0)
                }
            }.padding([.horizontal,.vertical], 20)
                .navigationBarTitle("News Ku")
        }.onAppear(perform: viewModel.loadData)
    }
}
