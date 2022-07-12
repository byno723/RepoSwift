//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import SwiftUI

@main
struct NewsAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
              HomeScreenCordinator()
            }
            .accentColor(.black)
        }
    }
}
