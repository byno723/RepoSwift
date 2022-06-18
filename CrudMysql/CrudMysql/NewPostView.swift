//
//  NewPostView.swift
//  CrudMysql
//
//  Created by gorbyno sitepu on 23/05/22.
//

import SwiftUI

struct NewPostView: View {
    @EnvironmentObject var viewModel : ViewModel
    @Binding var isPresented : Bool
    
    @Binding var name: String
    @Binding var code : String
    
    @State var isAlert = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.gray.opacity(0.1).ignoresSafeArea()
                VStack(alignment:.leading){
                    Text("Create New Post")
                        .font(.system(size: 16, weight: .bold))
                    
                    TextField("Kode Buku", text: $code).padding().background(Color.white)
                        .cornerRadius(6)
                        .padding(.bottom)
                    
                    TextField("Nama Buku", text: $name).padding().background(Color.white)
                        .cornerRadius(6)
                        .padding(.bottom)
                    
                    Spacer()
                }.padding()
                    .alert(isPresented: $isAlert, content: {
                        let name = Text("No Data")
                        let message = Text("Please fill you Name and Code !")
                        return Alert(title: name, message: message)
                    })
               
            }
            .navigationBarTitle("New Posts", displayMode:.inline)
            .navigationBarItems(leading: leading, trailing: trailling)
        }
        
    }
    
    var leading : some View{
        Button(action:{
            isPresented.toggle()
        }, label: {
            Text("Cancel")
        })
    }
    var trailling : some View{
        Button(action:{
            if name != "" && code != "" {
                let parameters : [String: Any] = ["Name" : name, "Code" : code]
                viewModel.createPost(parameters: parameters)
                viewModel.fetchPosts()
                isPresented.toggle()
                
            }else{
                isAlert.toggle()
            }
        }, label: {
           Text("Save")
        })
    }
}

//struct NewPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPostView()
//    }
//}
