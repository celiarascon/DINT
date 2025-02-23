//
//  ContentView.swift
//  GridFrutas
//
//  Created by Celia Rascón García on 23/2/25.
//

import SwiftUI

struct ContentView: View {
    let frutas = Fruta.datosFrutas
    
    @State private var nuevafruta: String = ""
    
    //let columnas = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())] // Cuatro columnas
    let columnas = [GridItem(.flexible()), GridItem(.flexible())] // Dos columnas
    
    var body: some View {
            TabView {
                NavigationView {
                    VStack {
                        ScrollView {
                            LazyVGrid(columns: columnas, spacing: 20) {
                                ForEach(frutas) { fruta in
                                    FrutaCard(fruta: fruta)
                                }
                            }
                            .padding()
                        }
                        .navigationTitle("🍋FRUTAS🍒")
                    }
                }
                .tabItem {
                    Label("Frutas", systemImage: "applelogo")
                }
                
                Text("Otra pestaña en desarrollo")
                    .tabItem {
                        Label("Favoritas", systemImage: "star")
                    }
            }
        }
    }

    struct FrutaCard: View {
        let fruta: Fruta
        
        var body: some View {
            VStack {
                Image(fruta.imagen)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                Text(fruta.nombre)
                    .font(.headline)
                
                Text(fruta.descripcion)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(3) // Limita la descripción a 3 líneas
                
                NavigationLink(destination: DetalleFrutasView(fruta: fruta)) {
                    Text("Ver detalles")
                        .font(.headline)
                        .padding()
                        .background(Color.yellow.opacity(0.3))
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }

    #Preview {
        ContentView()
    }
