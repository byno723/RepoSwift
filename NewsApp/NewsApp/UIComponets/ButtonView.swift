//
//  ButtonView.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import SwiftUI

struct ButtonView: View {
    var action : ()->Void = {}
    var text : String = ""
    var body: some View {
        Button(action: action, label: {
            Text(text)
                .font(.system(size: 16))
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width-80)
        })
        .background(Color.cyan)
        .cornerRadius(10)
        .padding(.vertical, 10)
        .padding(.top, 10)
        .frame(alignment: .bottom)
    }
}
