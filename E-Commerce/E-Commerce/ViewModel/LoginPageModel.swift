//
//  LoginPageModel.swift
//  E-Commerce
//
//  Created by gorbyno sitepu on 17/05/22.
//

import Foundation
import SwiftUI

class LoginPageModel : ObservableObject{
//    login Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool =  false
    
//    Register Properties
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false
    
    //    log status
        @AppStorage("log_status") var log_status : Bool = false
    
    
//    login Call
    func Login(){
//        do action
        withAnimation{
            log_status = true
        }
    }
    
    func Register(){
//        Do action
        withAnimation{
            log_status = true
        }
    }
    
    func ForgotPassword(){
//         Do Action
    }
    
}
