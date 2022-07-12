//
//  SavedListCustom.swift
//  TopUpEmoney
//
//  Created by gorbyno sitepu on 24/06/22.
//

import SwiftUI

struct SavedListCustom: View {
    var category : String = ""
    var phoneNumber : Int
    
    var body: some View {
        HStack{
            Image(systemName: "person")
                .padding()
                .frame(width: 50, height: 50)
                .background(.blue)
                .clipShape(Circle())
                .foregroundColor(.white)
               
            VStack(alignment:.leading){
                Text(category)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                Text(category)
                    .font(.system(size: 14, weight: .light, design: .rounded))
                    .foregroundColor(.secondary)
                Text(String("\(phoneNumber)"))
                    .font(.system(size: 14, weight: .light, design: .rounded))
                    .foregroundColor(.secondary)
            }
           
        } 
    }
}
//
//struct SavedListCustom_Previews: PreviewProvider {
//    static var previews: some View {
//        SavedListCustom()
//    }
//}
