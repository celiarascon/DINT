//
//  LoginViewModel.swift
//  mvvmNoticias
//
//  Created by Celia Rascón García on 28/2/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var authenticated = 0
    
    init() {
        if let sesion = UserDefaults.standard.object(forKey: "sesion") as? Int{
            authenticated = sesion
            
        } else {
            authenticated = 0
        }
    }
    func login(email: String, password: String){
        guard let url = URL(string: "https://reqres.in/api/login") else { return }
        let parametros = ["email": email, "password": password]
        let body = try! JSONSerialization.data(withJSONObject: parametros)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            guard let data = data else { return }

            do {
                let datos = try JSONDecoder().decode(LoginModel.self, from: data)
                if !datos.token.isEmpty {
                    DispatchQueue.main.async {
                        self.authenticated = 1
                        UserDefaults.standard.setValue(1, forKey: "sesion")
                    }
                }
            } catch let error as NSError {
                print("Error al hacer post: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.authenticated = 0
                }
            }
        }.resume()

        }
        
    }


