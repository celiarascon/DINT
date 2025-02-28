//
//  RecetasViewModel.swift
//  mvvmRecetas
//
//  Created by Celia Rascón García on 28/2/25.
//
import Foundation

class RecetasViewModel: ObservableObject {
    @Published var recetas: [Recetas] = []
    @Published var searchText: String = ""

    var filtradasPelicula: [Recetas] {
        if searchText.isEmpty {
            return recetas
        } else {
            return recetas.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }

    init() {
        fetch()
    }
    
    func fetch() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=") else {
            print("URL inválida")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error en la solicitud: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No se recibieron datos")
                return
            }

            // Imprime el JSON recibido
            if let jsonString = String(data: data, encoding: .utf8) {
                print("JSON recibido: \(jsonString)")
            }

            do {
                let resultado = try JSONDecoder().decode(RecetasResponse.self, from: data)
                DispatchQueue.main.async {
                    if resultado.meals.isEmpty {
                        print("No se encontraron recetas")
                    } else {
                        self.recetas = resultado.meals
                    }
                }
            } catch {
                print("Error al decodificar JSON: \(error.localizedDescription)")
            }
        }.resume()
    }

    func toggleFavorite(for receta: Recetas) {
        if let index = recetas.firstIndex(where: { $0.id == receta.id }) {
            recetas[index].isFavorite.toggle()
        }
    }
}
