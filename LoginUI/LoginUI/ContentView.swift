//
//  ContentView.swift
//  LoginUI
//
//  Created by gorbyno sitepu on 06/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       Login()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Login :  View{
    @State var username : String = ""
    @State var password : String = ""
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    
    
    var body: some View{
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    HStack{
                        VStack{
                            Text("Hi!").bold().font(.largeTitle).foregroundColor(Color.white)
                            Text("Welcome Back").font(.title).foregroundColor(Color.white)
                            
                        }
                        Spacer()
                        Image("bitmap").resizable().frame(width:120,height: 100)
                    }
                    Spacer()
                }.frame(height:150).padding(20).background(Color.purple)
                    .clipShape(CustumShape(corner: .bottomRight, radii: 50))
                    .edgesIgnoringSafeArea(.top)
                
                
//                form
                VStack(alignment:.leading){
                    Text("Username/email address")
                    TextField("Username...", text: $username)
                        .padding().background(lightGreyColor).cornerRadius(5)
                    
                    Text("Password")
                    SecureField("Password...", text: $password)
                        .padding().background(lightGreyColor).cornerRadius(5)
                    
                    HStack{
                        Button(action:{}){
                            Text("Forgot Password?")
                        }
                        Spacer()
                    }.padding([.top, .bottom],10)
                    
//                    sign In button
                    HStack{
                        Spacer()
                        Button(action:{}){
                            Text("Sign In").font(.callout).bold().foregroundColor(Color.white)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(15)
                    
//                    privacy
                    HStack{
                        Spacer()
                        Button(action:{}){
                            Text("Our Privacy Policy").font(.callout).bold().foregroundColor(Color.purple)
                        }
                        Spacer()
                    }.padding()
                    
                    HStack{
                        Text("Don't Have an Account?").bold().font(.callout).foregroundColor(Color.black)
                        Spacer()
                        Button(action:{}){
                            Text("Sign Up").font(.callout).bold().foregroundColor(Color.purple)
                        }
                    }.padding()
                    
                }.padding()
                
                Spacer()
                
            }
            
            
        }
    }
}


//custum shapes
struct CustumShape : Shape{
    var corner :  UIRectCorner
    var radii : CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radii, height: radii))
        
        return Path(path.cgPath)
    }
}
