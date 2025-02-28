//
//  mvvmNoticiasApp.swift
//  mvvmNoticias
//
//  Created by Celia Rascón García on 28/2/25.
//


import SwiftUI

@main
struct mvvmNoticiasApp: App {
    @StateObject var loginViewModel = LoginViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(loginViewModel)
        }
    }
}
