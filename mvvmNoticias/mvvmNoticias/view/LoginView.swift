//
//  LoginView.swift
//  mvvmNoticias
//
//  Created by Celia Rascón García on 28/2/25.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @EnvironmentObject var login: LoginViewModel  // 🔹 Se recibe correctamente el ViewModel

    var body: some View {
        VStack {
            Text("Email")
                .bold()
                .font(.headline)

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)

            Text("Password")
                .bold()
                .font(.headline)

            SecureField("Password", text: $password)
                .cornerRadius(8)

            Button(action: {
                login.login(email: email, password: password) // 🔹 Se usa correctamente
            }) {
                Text("Entrar").foregroundColor(.gray).bold()
            }
        }
        .padding(.all)
    }
}
