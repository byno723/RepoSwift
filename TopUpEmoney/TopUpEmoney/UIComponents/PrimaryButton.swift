//
//  PrimaryButton.swift
//  TopUpEmoney
//
//  Created by gorbyno sitepu on 24/06/22.
//

import SwiftUI

struct PrimaryButton: View {
    var title : String = ""
    var action : () ->Void = {}
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width-80)
        })
        .background(Color.cyan)
        .cornerRadius(10)
        .padding(.vertical,10)
        .padding(.top,10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton()
    }
}
