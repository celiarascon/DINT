//
//  PeliculaView.swift
//  mvvmPeliculas
//
//  Created by Celia Rascón García on 27/2/25.
//
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = PeliculaViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.peliculas.isEmpty {
                    ProgressView()  // Indicador de carga mientras se obtienen las películas
                } else {
                    List(viewModel.peliculas, id: \.id) { pelicula in
                        NavigationLink(destination: DetalleView(pelicula: pelicula)) {  // 🔹 Corregido: pasar la película completa
                            HStack {
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(pelicula.poster_path)")) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 100, height: 150)
                                
                                VStack(alignment: .leading) {
                                    Text(pelicula.title)
                                        .font(.headline)
                                    Text("⭐ \(pelicula.vote_average, specifier: "%.1f")")
                                        .font(.subheadline)
                                }
                            }
                        }
                    }
                    .navigationTitle("Películas Populares")
                }
            }
            .onAppear {
                viewModel.fetch()  // 🔹 Corregido: Llamar a la función fetch() directamente
            }
        }
    }
}

