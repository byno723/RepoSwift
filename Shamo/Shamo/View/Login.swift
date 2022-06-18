//
//  Login.swift
//  Shamo
//
//  Created by gorbyno sitepu on 30/05/22.
//

import SwiftUI

struct Login: View {
    
    @State var username : String = ""
    @State var password : String = ""
    
    var body: some View {
        ZStack{
            Color("bgcolor1").ignoresSafeArea()
            VStack{
                
          
            HStack{
                VStack(alignment:.leading){
                    Text("Login").font(.system(size: 24, weight: .semibold, design: .rounded)).foregroundColor(.white)
                    Text("Sign In to continue").foregroundColor(Color.gray)
                    
                }.padding(.bottom, 70)
               
                
                Spacer()
            }.padding(.top,30).padding(.leading)
            
            VStack(alignment:.leading){
                
              
                Text("Username").foregroundColor(Color("pricetext"))
                HStack{
                    Image(systemName: "person").foregroundColor(Color.white)
                    TextField("Your email address", text: $username).foregroundColor(Color.white)
                }.padding().background(Color("bgcolor2")).cornerRadius(5).foregroundColor(.white)
                
                Text("Password").foregroundColor(Color("pricetext"))
                HStack{
                    Image(systemName: "lock").foregroundColor(Color.white)
                    TextField("Your email address", text: $password)
                }.padding().background(Color("bgcolor2")).cornerRadius(5).foregroundColor(.white)
                
                
                HStack{
                    Spacer()
                    Button(action:{}){
                        Text("Sign In").font(.callout).bold().foregroundColor(Color.white)
                    }
                    Spacer()
                }
                .padding()
                .background(Color("primarycolor"))
                .cornerRadius(15)
                .padding(.top,30)
                
              
              
                
            }.padding()
                
                Spacer()
           
                HStack{
                    Text("Don't have an account?").foregroundColor(Color.white)
                    
                  
                    Text("Sign Up").foregroundColor(Color("pricetext"))
                      
                    
                }.padding()
                
            }
            
          
        }
    }
}
//
//struct Login_Previews: PreviewProvider {
//    static var previews: some View {
//        Login()
//    }
//}
