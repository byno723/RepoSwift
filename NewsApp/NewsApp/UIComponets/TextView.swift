//
//  TextView.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import SwiftUI

struct TextView: View {
    let text : String
    let fontsize: CGFloat
    var body: some View {
      Text(text)
            .font(Font.system(size: fontsize))
            .foregroundColor(.black)
            .multilineTextAlignment(.leading)
            .frame(maxWidth:.infinity, alignment: .leading)
    }
}
