//
//  mvvmRecetasApp.swift
//  mvvmRecetas
//
//  Created by Celia Rascón García on 28/2/25.
//

import SwiftUI

@main
struct mvvmRecetasApp: App {
    @StateObject var loginViewModel = LoginViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(loginViewModel)
        }
    }
}
