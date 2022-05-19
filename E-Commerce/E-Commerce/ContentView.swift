//
//  ContentView.swift
//  E-Commerce
//
//  Created by gorbyno sitepu on 17/05/22.
//

import SwiftUI

struct ContentView: View {
//    log status
    @AppStorage("log_status") var log_status : Bool = false
    var body: some View {
        Group{
            if log_status{
                MainPage()
            }else{
                OnBoarding()
            }
        }
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
