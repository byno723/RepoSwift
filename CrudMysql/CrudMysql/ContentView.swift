//
//  ContentView.swift
//  CrudMysql
//
//  Created by gorbyno sitepu on 23/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       HomeView()
    }
}


struct HomeView: View {
    @EnvironmentObject var viewModel : ViewModel
    @State var isPresentedNewPost = false
    @State var name = ""
    @State var code = ""
    
    var body: some View {
        NavigationView{
            
            List{
                ForEach(viewModel.items, id: \.Id){ item in
                    NavigationLink(
                        destination: DetailView(item: item),
                        label: {
                            VStack(alignment:.leading){
                                Text(item.Name)
                                Text(item.Code).font(.caption).foregroundColor(.gray)
                            }
                       
                        })
                }.onDelete(perform: deletePost)
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Posts")
            .navigationBarItems(trailing: plusButton)
            
//            pop  up
        }.sheet(isPresented: $isPresentedNewPost, content: { NewPostView(isPresented: $isPresentedNewPost, name: $name, code: $code)})
        
    }
    
    private func deletePost(indexSet: IndexSet){
        let id = indexSet.map{viewModel.items[$0].Id}
        DispatchQueue.main.async {
            let parameters : [String: Any] = ["id" : id[0]]
            self.viewModel.deletePost(parameters: parameters)
            self.viewModel.fetchPosts()
        }
    }
    
    var plusButton: some View{
        Button(action: {
            isPresentedNewPost.toggle()
            
        }, label: {
            Image(systemName: "plus")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
