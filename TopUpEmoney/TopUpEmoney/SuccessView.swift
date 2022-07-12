//
//  SuccessView.swift
//  TopUpEmoney
//
//  Created by gorbyno sitepu on 24/06/22.
//

import SwiftUI

struct SuccessView: View {
    @Binding var sourceNavigationLink : String?
    var body: some View {
        VStack{
            Image("bitmap")
                .resizable()
                .frame(width: 200, height: 200)
                .aspectRatio(contentMode: .fill)
                .padding(.bottom,30)
            
            Button(action: {
                sourceNavigationLink = nil
            }, label: {
                Text("Back to Home").underline()
            })
        }
    }
}
//
//struct SuccessView_Previews: PreviewProvider {
//    static var previews: some View {
//        SuccessView()
//    }
//}
