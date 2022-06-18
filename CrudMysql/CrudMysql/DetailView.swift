//
//  DetailView.swift
//  CrudMysql
//
//  Created by gorbyno sitepu on 23/05/22.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var viewModel : ViewModel
    @Environment(\.presentationMode) var presentationMode
    let item :  PostModel
    @State var name = ""
    @State var code = ""
    
    var body: some View {
        ZStack{
            Color.gray.opacity(0.1).ignoresSafeArea()
            VStack(alignment:.leading){
                Text("Update Post")
                    .font(.system(size: 16, weight: .bold))
                
                TextField("Kode Buku", text: $code).padding().background(Color.white)
                    .cornerRadius(6)
                    .padding(.bottom)
                
                TextField("Nama Buku", text: $name).padding().background(Color.white)
                    .cornerRadius(6)
                    .padding(.bottom)
                
                Spacer()
            }.padding()
                
//            to show detail
                .onAppear(perform: {
                    self.name = item.Name
                    self.code = item.Code
                })
           
        }
        .navigationBarTitle("New Posts", displayMode:.inline)
        .navigationBarItems( trailing: trailling)
    }
    
    var trailling : some View{
        Button(action:{
//            update post
            if name != "" && code != ""{
                let parameters :  [String: Any] = ["Id" : item.Id, "Name" : name, "Code" : code]
                viewModel.updatePost(parameters: parameters)
                viewModel.fetchPosts()
                presentationMode.wrappedValue.dismiss()
                
            }
           
        }, label: {
           Text("Update")
        })
    }
}
//
//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
