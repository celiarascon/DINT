//
//  ContentView.swift
//  RepasoExamen
//
//  Created by Celia Rascón García on 27/2/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var login: PostViewModel
    
    var body: some View {
        Group{
            if login.authenticated == 0 {
                Login()
            } else if login.authenticated == 1 {
                Home()
            } else if login.authenticated == 2 {
                VStack{
                    Text("No se ha podido autenticar")
                    Button(action: {
                        login.authenticated = 0
                    }){
                        Text("Volver")
                    }
                }
            }
        }
    }
}
 
