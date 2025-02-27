//
//  Login.swift
//  RepasoExamen
//
//  Created by Celia Rascón García on 27/2/25.
//

import SwiftUI

struct Login: View {
    @State var email: String = ""
    @State var password: String = ""
    @EnvironmentObject var login: PostViewModel
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Email").foregroundColor(.white).bold()
                TextField("Email", text: $email)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(8)
                    .keyboardType(.emailAddress)
                
                Text("Password").foregroundColor(.white).bold()
                SecureField("Password", text: $password)
                    .background(Color.white)
                    .cornerRadius(8)
                Button(action: {
                    self.login.login(email: self.email, password: self.password)
                }) {
                    Text("Entrar").foregroundColor(.white).bold()
                }
            }.padding(.all)
        }
    }
}
