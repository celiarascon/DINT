//
//  DetalleViewModel.swift
//  RepasoExamen
//
//  Created by Celia Rascón García on 27/2/25.
//

import Foundation

class DetalleViewModel: ObservableObject {
    @Published var first_name = ""
    @Published var email =  ""
    @Published var avatar = ""
    
    func fetch(id: Int) {
        guard let url = URL(string: "https//regres.in/api/users/\(id)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let json = try JSONDecoder().decode(User.self, from: data)
                DispatchQueue.main.async {
                    self.first_name = json.data.first_name
                    self.email = json.data.email
                    self.avatar = json.data.avatar
                }
                
            }catch let error as NSError {
                print("Error en el Json: \(error.localizedDescription)")
            }
        }.resume()
        
    }
}
