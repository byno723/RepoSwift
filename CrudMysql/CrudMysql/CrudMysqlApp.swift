//
//  CrudMysqlApp.swift
//  CrudMysql
//
//  Created by gorbyno sitepu on 23/05/22.
//

import SwiftUI

@main
struct CrudMysqlApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ViewModel())
        }
    }
}
