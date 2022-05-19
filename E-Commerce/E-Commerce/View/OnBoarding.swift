//
//  OnBoarding.swift
//  E-Commerce
//
//  Created by gorbyno sitepu on 17/05/22.
//

import Foundation
import SwiftUI

struct OnBoarding: View{
//    showing login page
    @State var showLoginPage : Bool = false
    
    var body: some View{
        VStack(alignment:.leading){
            Text("Find your \nGadget").font(.system(size: 55,weight: .bold,design: .rounded)).foregroundColor(.white)
            Image("tiger").resizable().aspectRatio(contentMode: .fit)
            Button{
                withAnimation{
                    showLoginPage = true
                }
            }label: {
                Text("Get Started").font(.system(size: 18,weight: .medium)).padding(.vertical,18).frame(maxWidth:.infinity).background(.white).cornerRadius(10).shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5).foregroundColor(.blue)
            }.padding(.horizontal,30)
            
            
            Spacer()
            
        }.padding().frame(maxWidth:.infinity, maxHeight: .infinity).background(.blue)
        
            .overlay(
                Group{
                    if showLoginPage{
                        LoginPage().transition(.move(edge: .bottom))
                    }
                }
            )
    }
}

struct OnBoarding_Previews: PreviewProvider{
    static var previews: some View{
        OnBoarding()
    }
}
