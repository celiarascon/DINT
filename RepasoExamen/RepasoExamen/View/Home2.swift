//
//  Home2.swift
//  RepasoExamen
//
//  Created by Celia Rascón García on 27/2/25.
//

import SwiftUI

struct Home2: View {
    @StateObject var json2 = Modelo2ViewModel()
    
    var body: some View {
        if json2.datosModelo.data.isEmpty {
            ProgressView()
        } else{
            List(json2.datosModelo.data, id:\.id){ item in
                NavigationLink(destination: DetalleView(id: item.id)) {
                    HStack{
                        AsyncImage(url: URL(string: item.avatar)!){ image in
                            image
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipped()
                                .clipShape(Circle())
                        } placeholder: {
                            ProgressView()
                        }
                        VStack(alignment: .leading){
                            Text(item.first_name).font(.title)
                            Text(item.email).font(.subheadline)
                        }
                    }.navigationBarTitle("Json con imagen")
                }
            }
        }
    }
}
