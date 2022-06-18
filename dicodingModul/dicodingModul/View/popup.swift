//
//  popup.swift
//  dicodingModul
//
//  Created by gorbyno sitepu on 25/05/22.
//

import SwiftUI

struct popup: View {
    @State private var showingActionSheet : Bool = false
    
    var body: some View {
        Button("Logout"){
            self.showingActionSheet = true
        }.actionSheet(isPresented: $showingActionSheet){
            ActionSheet(title: Text("Warning"), message: Text("Are you sure?"), buttons: [.default(Text("Yes")){
                // aksi ketika menekan tombol yes
            },.default(Text("No")){
                // aksi ketika menekan tombol no
            },.cancel() ])
        }
    }
    
}

struct popup_Previews: PreviewProvider {
    static var previews: some View {
        popup()
    }
}
