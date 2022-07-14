//
//  SuccessScreen.swift
//  NewsApp
//
//  Created by Gorbyno S on 14/07/22.
//

import SwiftUI

struct SuccessScreen: View {
    var body: some View {
        ZStack{
            render()
        }
    }
    private func render()-> some View{
        VStack{
            Image(systemName: "person")
            TextView(text: "Success", fontsize: 30)
        }
    }
}
