//
//  LoginPage.swift
//  E-Commerce
//
//  Created by gorbyno sitepu on 17/05/22.
//

import Foundation
import SwiftUI

struct LoginPage : View{
    @StateObject var loginData: LoginPageModel = LoginPageModel()
    
    var body: some View{
        VStack{
            
//            welcome back text
            Text("Welcome \nBack").foregroundColor(.white)
                .font(.system(size: 55,weight: .bold,design: .rounded))
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding()
            .frame(height:800 / 3.5)
            
            
            
            
            ScrollView(.vertical,showsIndicators: false){
                
//                login page form
                VStack(spacing:15){
                    Text(loginData.registerUser ? "Register" : "Login").font(.system(size: 24,weight: .bold,design: .rounded))
                        .frame(maxWidth:.infinity,alignment: .leading)
                    
//                    custum Text Field
                    CustomTextField(icon: "envelope", title: "Email", hint: "byno@gmail.com", value: $loginData.email, showPassword: .constant(false))
                        .padding(.top,30)
                    
                    CustomTextField(icon: "lock", title: "Password", hint: "123456", value: $loginData.password, showPassword: $loginData.showPassword)
                        .padding(.top,10)
               
//                    register Reenter password
                    if loginData.registerUser{
                        
                        CustomTextField(icon: "lock", title: "Re-Enter Password", hint: "123456", value: $loginData.re_Enter_Password, showPassword: $loginData.showReEnterPassword)
                            .padding(.top,10)
                      
                    }
                    
//                    Forgot Password Button
                  Button{
                      loginData.ForgotPassword()
                      }label: {
                          Text("Forgot password?").font(.system(size: 14,weight: .medium,design: .rounded))
                      }.padding(.top,8).frame(maxWidth:.infinity, alignment: .leading)
                    
//                    login Button
                    
                    Button{
                        if loginData.registerUser{
                            loginData.Register()
                        }else{
                            loginData.Login()
                        }
                        }label: {
                            Text("Login").font(.system(size: 17,weight: .bold,design: .rounded)).frame(maxWidth:.infinity).padding(.vertical,20).background(.blue).foregroundColor(.white).cornerRadius(15).shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
                        }.padding(.top,25).padding(.horizontal)
                    
//                    register button user
                    
                    Button{
                        withAnimation{
                            loginData.registerUser.toggle()
                        }
                        }label: {
                            Text(loginData.registerUser ? "Back to Login" : "Create Account").font(.system(size: 14,weight: .medium,design: .rounded))
                        }.padding(.top,8).frame(maxWidth:.infinity)
                      
                    
                    
                }.padding(30)
                
            }.frame(maxWidth:.infinity, maxHeight: .infinity).background(Color.white
//            applying Custom Corners
                .clipShape(CustomCorners(corners: [.topLeft,.topRight], radius: 25)).ignoresSafeArea()
            )
            
        }.frame(maxWidth:.infinity, maxHeight: .infinity).background(.blue)
        
//        clearing data when changes..
//        optional
            .onChange(of: loginData.registerUser){
                newValue in
                loginData.email = ""
                loginData.password = ""
                loginData.re_Enter_Password = ""
                loginData.showPassword = false
                loginData.showReEnterPassword = false
            }
    }
    
//    text field
    @ViewBuilder
    func CustomTextField(icon: String, title:String, hint:String, value:Binding<String>, showPassword: Binding<Bool>)->some View{
        
        VStack(alignment:.leading, spacing: 12){
            Label{
                Text(title).font(.system(size: 14))
            }icon: {
                Image(systemName: icon)
            }.foregroundColor(Color.black.opacity(0.8))
            
            if title.contains("Password") &&  !showPassword.wrappedValue{
                SecureField(hint,text: value)
                    .padding(.top,2)
            }else{
                TextField(hint,text: value)
                    .padding(.top,2)
            }
          
            Divider()
                .background(Color.black.opacity(0.4))
        }
//        showing show button for password field
        .overlay(
            Group{
                if title.contains("Password"){
                    Button(action:{
                        showPassword.wrappedValue.toggle()
                    }, label: {
                        Text(showPassword.wrappedValue ? "Hide" : "Show").font(.system(size: 13,weight: .bold,design: .rounded))
                    }).offset(y:8)
                      
                }
            },alignment: .trailing
        )
    }
    
}

struct LoginPage_Previews: PreviewProvider{
    static var previews: some View{
        LoginPage()
    }
}
