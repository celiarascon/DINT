//
//  ContentView.swift
//  mvvmRecetas
//
//  Created by Celia Rascón García on 28/2/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var login: LoginViewModel
    @StateObject var recetasViewModel = RecetasViewModel()

    var body: some View {
        if login.authenticated == 1 {
            TabView {
                RecetasView(viewModel: recetasViewModel)
                    .tabItem {
                        Label("Recetas", systemImage: "list.bullet")
                    }

                FavoritosView(viewModel: recetasViewModel)
                    .tabItem {
                        Label("Favoritos", systemImage: "heart.fill")
                    }
            }
        } else {
            LoginView()
        }
    }
}
