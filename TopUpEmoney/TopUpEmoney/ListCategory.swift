//
//  ListCategory.swift
//  TopUpEmoney
//
//  Created by gorbyno sitepu on 24/06/22.
//

import SwiftUI

struct ListCategory: View {
    @EnvironmentObject var viewModel : ViewModel
    
    var categories = ["OVO", "GOPAY", "LINK AJA"]
    @Binding var selectedCategory : String
    
    var body: some View {
        ZStack(alignment:.top){
            Capsule()
                .frame(width: 20, height: 5)
            VStack(alignment:.leading){
                
                ForEach(viewModel.items, id: \.self){ categories in
                    Text(categories.title)
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                        .padding(.bottom,8)
                        .onTapGesture {
                            selectedCategory = categories.title
                        }
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.secondary)
                        .padding(.top,5)
                }
                Spacer()
            }.padding(.all,20)
            
        }
       
    }
}

//struct ListCategory_Previews: PreviewProvider {
//    static var previews: some View {
//        ListCategory()
//    }
//}
