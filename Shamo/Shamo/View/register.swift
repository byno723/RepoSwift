//
//  register.swift
//  Shamo
//
//  Created by gorbyno sitepu on 30/05/22.
//

import SwiftUI

struct register: View {
    @State var fullname : String = ""
    @State var email : String = ""
    @State var username : String = ""
    @State var password : String = ""
    var body: some View {
        ZStack{
            Color("bgcolor1").ignoresSafeArea()
            VStack{
                
          
            HStack{
                VStack(alignment:.leading){
                    Text("Register").font(.system(size: 24, weight: .semibold, design: .rounded)).foregroundColor(.white)
                    Text("Register and happy sharing").foregroundColor(Color.gray)
                    
                }.padding(.bottom, 40)
               
                
                Spacer()
            }.padding(.top,30).padding(.leading)
            
            VStack(alignment:.leading){
                
              
                Text("Fullname").foregroundColor(Color("pricetext"))
                HStack{
                    Image(systemName: "person").foregroundColor(Color.white)
                    TextField("Your fullname", text: $fullname).foregroundColor(Color.white)
                }.padding().background(Color("bgcolor2")).cornerRadius(5).foregroundColor(.white)
                
                
                Text("Email").foregroundColor(Color("pricetext"))
                HStack{
                    Image(systemName: "mail").foregroundColor(Color.white)
                    TextField("Your email address", text: $email).foregroundColor(Color.white)
                }.padding().background(Color("bgcolor2")).cornerRadius(5).foregroundColor(.white)
                
                
                Text("Username").foregroundColor(Color("pricetext"))
                HStack{
                    Image(systemName: "person").foregroundColor(Color.white)
                    TextField("Your username", text: $username).foregroundColor(Color.white)
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
                    Text("Already have an account!").foregroundColor(Color.white)
                    
                  
                    Text("Sign In").foregroundColor(Color("pricetext")).onTapGesture {
                       
                    }
                    
                }.padding()
                
            }
            
          
        }
    }
}

struct register_Previews: PreviewProvider {
    static var previews: some View {
        register()
    }
}
