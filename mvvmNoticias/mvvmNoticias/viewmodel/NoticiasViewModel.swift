//
//  NoticiasViewModel.swift
//  mvvmNoticias
//
//  Created by Celia Rascón García on 28/2/25.
//
import Foundation

class NoticiasViewModel: ObservableObject {
    @Published var noticias: [Noticias] = []

    let apiKey = "479b2132ff584136b434d984785de6aa"
    init() {
        fetch()
    }
    
    func fetch() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)") else {
            print("❌ URL inválida")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("❌ Error en la solicitud: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("❌ No se recibieron datos")
                return
            }

            // 🔹 Imprimir JSON antes de decodificar
            if let jsonString = String(data: data, encoding: .utf8) {
                print("📄 JSON recibido: \(jsonString)")
            }

            do {
                let resultado = try JSONDecoder().decode(NoticiasResponse.self, from: data)
                DispatchQueue.main.async {
                    self.noticias = resultado.articles
                }
            } catch {
                print("❌ Error al decodificar JSON: \(error.localizedDescription)")
            }
        }.resume()
    }

}

