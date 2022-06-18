//
//  Profile.swift
//  Shamo
//
//  Created by gorbyno sitepu on 30/05/22.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        NavigationView{
           
                Form{
                    Section(){
                        NavigationLink(destination: register()){
                            HStack{
                                Image("profil").resizable().frame(width: 50, height: 50).clipShape(Circle())
                                VStack(alignment:.leading){
                                    Text("Gorbyno sitepu").font(.headline)
                                    Text("@byno")
                                }
                            }.padding(.top,10)
                                .padding(.bottom,10)
                        }
                      
                    }
                    
                    Section(header:Text("Account")){
                        HStack(spacing:20){
                            Image(systemName: "person").frame(width: 35, height: 35).background(Color.green).cornerRadius(10).foregroundColor(.white)
                            Text("Profile")
                        }
                        HStack(spacing:20){
                            Image(systemName: "star.fill").frame(width: 35, height: 35).background(Color.orange).cornerRadius(10).foregroundColor(.white)
                            Text("Rating App")
                        }
                    }
                    
                    Section(header:Text("Setting")){
                        HStack(spacing:20){
                            Image(systemName: "sparkle").frame(width: 35, height: 35).background(Color.blue).cornerRadius(10).foregroundColor(.white)
                            Text("Privacy & Policy")
                        }
                        HStack(spacing:20){
                            Image(systemName: "gearshape.2.fill").frame(width: 35, height: 35).background(Color.primary).cornerRadius(10).foregroundColor(.white)
                            Text("Terms & Service")
                        }
                        HStack(spacing:20){
                            Image(systemName: "star.fill").frame(width: 35, height: 35).background(Color.red).cornerRadius(10).foregroundColor(.white)
                            Text("Log Out")
                        }
                    }
                    
                    
                }
            
          
                .navigationBarTitle("Profile")
        }
        
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
