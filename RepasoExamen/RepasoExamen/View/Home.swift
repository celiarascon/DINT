//
//  Home.swift
//  RepasoExamen
//
//  Created by Celia Rascón García on 27/2/25.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var login: PostViewModel
    @StateObject var json = Modelo1ViewModel()
    
    var body: some View {
        NavigationStack {
            if json.datosModelo.isEmpty {
                ProgressView()
            } else {
                List(json.datosModelo, id: \.id){ item in
                    VStack(alignment: .leading) {
                        Text(item.name)
                        Text(item.email)
                        Text(item.address.geo.lat)
                        Text(item.address.geo.lng)
                    }
                }.navigationBarTitle("JSON")
                    .navigationBarItems(leading: Button(action: {
                        UserDefaults.standard.removeObject(forKey: "sesion")
                        login.authenticated = 0
                        
                    }){
                        Text("Salir")
                    }, trailing:
                    NavigationLink(destination:Home2()){
                        Text("Siguiente")
                    }
                )
            }
        }
    }
}
