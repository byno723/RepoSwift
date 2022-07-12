//
//  ImageView.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import SwiftUI

struct ImageView: View {
    let url :  String
    var body: some View {
        AsyncImage(url: URL(string: url),
        content: { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth:.infinity)
                .frame(height:200)
                .clipped()
        },
            placeholder: {
            ProgressView()
        }
                   
        )
    }
}
