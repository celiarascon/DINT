//
//  DetalleFrutasView.swift
//  GridFrutas
//
//  Created by Celia Rascón García on 23/2/25.
//

import Foundation
import SwiftUI

struct DetalleFrutasView: View{
    let fruta: Fruta
    
    var body: some View {
        VStack{
            Image(fruta.imagen)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
                .cornerRadius(20)
            Text(fruta.nombre)
                .font(.headline)
                .fontWeight(.bold)
                .padding()
            Text(fruta.descripcion)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding()
            
            Spacer()
        }
        .navigationTitle(fruta.nombre)
    }
}
