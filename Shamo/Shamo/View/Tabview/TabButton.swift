//
//  TabButton.swift
//  Shamo
//
//  Created by gorbyno sitepu on 30/05/22.
//

import SwiftUI

struct TabButton: View {
    var title :  String
    @Binding var selected :  String
    
    var animation: Namespace.ID
    
    var body: some View {
        Button(action:{
            withAnimation(.spring()){selected = title}
        }){
            Text(title)
                .font(.system(size: 15, weight: .bold)).foregroundColor(selected == title ? .white : Color("pricetext"))
                .padding(.vertical,10)
                .padding(.horizontal, selected == title ?  20 : 0)
                .background(
//                    for slide effect animation
                    ZStack{
                        if selected == title{
                            Color("primarycolor").clipShape(Capsule())
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }
                  
                    
                )
        }
    }
}

