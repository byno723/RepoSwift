//
//  CustomTextField.swift
//  TopUpEmoney
//
//  Created by gorbyno sitepu on 24/06/22.
//

import SwiftUI

struct CustomTextField: View {
    @State var text : String = ""
    var placeholder : String = ""
    var title : String = ""
    var icon : String = ""
    var required : String = ""
    var body: some View {
        VStack(alignment:.leading){
            Text(title).font(.system(size: 16, weight: .medium, design: .rounded))
                .padding(.bottom, 10)
            HStack{
                TextField(
                    placeholder,
                    text: $text
                )
                Spacer(minLength: 0)
                Image(systemName: icon)
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.secondary)
                .padding(.top,5)
            Text("Required")
                .foregroundColor(.red)
                .font(.system(size: 14))
        }.padding(.bottom,10)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField()
    }
}
