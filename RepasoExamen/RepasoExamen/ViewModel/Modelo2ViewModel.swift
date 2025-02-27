//
//  Modelo2ViewModel.swift
//  RepasoExamen
//
//  Created by Celia Rascón García on 27/2/25.
//

import Foundation
class Modelo2ViewModel: ObservableObject {
    @Published var datosModelo = Modelo2(data: [])
    
    init() {
        fetch()
    }
    
    func fetch() {
        guard let url = URL(string: "https://regres.in/api/users?page=2") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response , error in
            guard let data = data else { return}
            do {
                let json = try JSONDecoder().decode(Modelo2.self, from: data)
                DispatchQueue.main.async {
                    self.datosModelo = json
                }
            } catch let error as NSError {
                print("Error en el JSON:  \(error.localizedDescription)")
            }
        }.resume()
    }
}


