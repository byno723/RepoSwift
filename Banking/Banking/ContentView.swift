//
//  ContentView.swift
//  Banking
//
//  Created by gorbyno sitepu on 07/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
       
                Home()
          
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home : View{
    var body: some View{
        ZStack{
            
            VStack{
                NavigationView{
                    ZStack{
                        Color("back").edgesIgnoringSafeArea(.all)
                   
                        VStack{
                            
    //                      kontent
                          konten()
                            
                          
                            ScrollView{
                                HStack{
                                    Text("Sevices").font(.title).foregroundColor(.white).padding(.leading,30)
                                    Spacer()
                                   
                                }
                                ScrollView(.horizontal, showsIndicators: false){
                                    HStack{
                                        
                                            VStack{
                                                     Image(systemName: "dollarsign.circle")
                                                    .font(.system(size: 50))
                                                    .foregroundColor(.yellow)
                                                    .padding([.trailing,.leading],30).padding([.top,.bottom],20).background(Color.black.opacity(0.2)).cornerRadius(20)
                                                
                                                Text("Communal \nPayments").foregroundColor(.white).font(.callout)
                                            }

                                            VStack{
                                                     Image(systemName: "creditcard.fill")
                                                    .font(.system(size: 50))
                                                    .foregroundColor(.blue)
                                                    .padding([.trailing,.leading],30).padding([.top,.bottom],20).background(Color.black.opacity(0.2)).cornerRadius(20)
                                                
                                                Text("Money \nTransaction").foregroundColor(.white).font(.callout)
                                            }
                                        
                                            VStack{
                                                     Image(systemName: "signature")
                                                    .font(.system(size: 50))
                                                    .foregroundColor(.orange)
                                                    .padding([.trailing,.leading],30).padding([.top,.bottom],20).background(Color.black.opacity(0.2)).cornerRadius(20)
                                                
                                                Text("Money \nBox").foregroundColor(.white).font(.callout)
                                            }
                                        
                                        VStack{
                                                 Image(systemName: "cross.circle.fill")
                                                .font(.system(size: 50))
                                                .foregroundColor(.green)
                                                .padding([.trailing,.leading],30).padding([.top,.bottom],20).background(Color.black.opacity(0.2)).cornerRadius(20)
                                            
                                            Text("Health \n Insurance").foregroundColor(.white).font(.callout)
                                        }
                                        
                                    }.padding([.leading,.trailing],30).multilineTextAlignment(.center)
                                   
                                }
                                
                                HStack{
                                  
                                    Text("Notifications").font(.title).foregroundColor(.white).padding(.leading,30)
                                   
                                    Text("2")
                                        .foregroundColor(Color.white)
                                        .frame(width:10, height: 10)
                                        .font(.body)
                                        .padding(8)
                                        .background(Color.red)
                                        .clipShape(Circle())
                                       
                                    
                                    Spacer()
                                }.padding(.top)
                                
                                ScrollView(.vertical, showsIndicators: false){
                                    VStack{
                                       
                                        
                                        HStack(){
                                            Image(systemName: "lock.rotation").font(.system(size: 30)).foregroundColor(.white)
                                            Text("Account password successfully  \nchanged").foregroundColor(.gray)
                                            Spacer()
                                        }.padding().background(Color.secondary).cornerRadius(10)
                                        
                                        HStack(){
                                            Image(systemName: "applelogo").font(.system(size: 30)).foregroundColor(.white)
                                            Text("Orange Card Successfully added to Apple Pay").foregroundColor(.gray)
                                            Spacer()
                                        }.padding().background(Color.secondary).cornerRadius(10)
                                    }.padding(.horizontal)
                                    
                                   
                                }
                             
                            }
                           
                            
                           
                          Spacer()
                           
    //                        navbar
                                .navigationBarItems(leading:
                                HStack{
                                    Image("profil").resizable().cornerRadius(20).clipShape(Circle()).frame(width:50, height: 50)
                                    VStack(alignment:.leading){
                                        Text("Welcome Back!").font(.system(size: 14,weight: .medium)).foregroundColor(.gray)
                                        Text("Gorbyno Sitepu").foregroundColor(.white).bold()
                                    }
                                }, trailing:
                                    ZStack{
                                   
                                        Image(systemName: "bell.fill").foregroundColor(.white)
                                    .padding([.trailing,.leading]).padding([.top,.bottom],15).background(Color.cyan).cornerRadius(10)
                                   
                                    
                                    Text("2")
                                        .foregroundColor(Color.white)
                                        .frame(width:10, height: 10)
                                        .font(.body)
                                        .padding(6)
                                        .background(Color.red)
                                        .clipShape(Circle())
                                        .offset(x:12)
                                        .offset(y:-10)
                                    }
                                )
                            
                        }
                        
                       
                        
                        
                    }
                    .navigationBarTitle("",displayMode: .inline)
                    
                }
                .navigationViewStyle(StackNavigationViewStyle())
            }
            
        }
      
    }
}


struct konten : View{
    var body: some View{
        ZStack{
            Image("ocbc").resizable().frame(height:250).aspectRatio(contentMode: .fit)
            VStack(alignment:.leading){
                Text("5322 2233 1534 2523").foregroundColor(.white).font(.system(size: 18,weight: .medium, design: .rounded)).padding(.top,50).padding(15)
                Text("06/01").foregroundColor(.white).font(.system(size: 14,weight: .regular, design: .rounded))
            }
        }
    }
}
