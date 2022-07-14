//
//  TextfieldView.swift
//  NewsApp
//
//  Created by Gorbyno S on 14/07/22.
//

import SwiftUI

struct TextfieldView: View {
    @State var text : String = ""
    var placeholder: String = ""
    var body: some View {
        VStack{
            TextField(placeholder, text: $text)
            Rectangle()
                .frame(height:1)
                .foregroundColor(.secondary)
        }
    }
}
