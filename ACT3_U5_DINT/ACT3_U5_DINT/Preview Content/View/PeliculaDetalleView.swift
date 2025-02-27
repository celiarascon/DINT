//
//  PeliculaDetalleView.swift
//  ACT3_U5_DINT
//


import Foundation
import SwiftUI
import Combine

struct PeliculaDetalleView: View {
    let pelicula: Pelicula
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let url = pelicula.posterURL {
                    AsyncImage(url: url) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                HStack {
                    Text(pelicula.title).font(.largeTitle).bold()
                    Text("⭐ \(pelicula.voteAverage, specifier: "%.1f")")
                    Spacer()
                }
                Text(pelicula.releaseDate).foregroundColor(Color("redCarpet"))

                .padding(.vertical)
                
                Text("Sinopsis").font(.headline).padding(.top).foregroundColor(.gray)
                Text(pelicula.overview).multilineTextAlignment(.center)
                
                    .padding(.vertical)
                
                Text("Categorías").font(.headline).foregroundColor(.gray)
                if let genreIds = pelicula.genreIds {
                    HStack {
                        ForEach(genreIds, id: \.self) { genre in
                            Text(genreName(for: genre))
                                .padding(5)
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(5)
                        }
                    }
                }
            }
            .padding()
        }
    }
    
    func genreName(for id: Int) -> String {
        let genres = [
            28: "Acción", 12: "Aventura", 16: "Animación", 35: "Comedia", 80: "Crimen",
            99: "Documental", 18: "Drama", 10751: "Familiar", 14: "Fantasía", 36: "Historia",
            27: "Terror", 10402: "Música", 9648: "Misterio", 10749: "Romance", 878: "Ciencia ficción",
            10770: "Película de TV", 53: "Suspenso", 10752: "Bélica", 37: "Western"
        ]
        return genres[id] ?? "Desconocido"
    }
}
