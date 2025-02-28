//
//  ContentView.swift
//  mvvmNoticias
//
//  Created by Celia Rascón García on 28/2/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var login: LoginViewModel // 🔹 Recibe el EnvironmentObject

    var body: some View {
        if login.authenticated == 1 {
            NoticiasView() // 🔹 Si está autenticado, muestra Noticias
        } else {
            LoginView()  // 🔹 Si no, muestra la pantalla de Login
        }
    }
}

 
