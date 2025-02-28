//
//  PeliculaViewModel.swift
//  mvvmPeliculas
//
//  Created by Celia Rascón García on 27/2/25.
//

import Foundation

class PeliculaViewModel: ObservableObject {
    @Published var peliculas: [Pelicula] = []

    let apiKey = "7503ee2abe08e9e8a580a457089cdff6"
    init() {
        fetch()
    }
    
    func fetch() {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=es-ES") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error en la solicitud: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No se recibieron datos")
                return
            }

            do {
                let resultado = try JSONDecoder().decode(PeliculasResponse.self, from: data) // 🔹 Cambio aquí
                DispatchQueue.main.async {
                    self.peliculas = resultado.results
                }
            } catch {
                print("Error al decodificar JSON: \(error.localizedDescription)")
            }
        }.resume()
    }

}
