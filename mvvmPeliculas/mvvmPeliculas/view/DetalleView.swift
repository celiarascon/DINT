//
//  DetalleView.swift
//  mvvmPeliculas
//
//  Created by Celia Rascón García on 27/2/25.
//

import SwiftUI

struct DetalleView: View {
    var pelicula: Pelicula
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(pelicula.poster_path)")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 250, height: 350)
                .cornerRadius(12)
                
                Text(pelicula.title)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Text("⭐ \(pelicula.vote_average, specifier: "%.1f")")
                    .font(.title2)
                    .foregroundColor(.yellow)
                
                Text(pelicula.overview)
                    .font(.body)
                    .padding()
            }
        }
        .navigationTitle(pelicula.title)
    }
}
