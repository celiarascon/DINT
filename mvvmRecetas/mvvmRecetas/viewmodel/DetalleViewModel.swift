//
//  DetalleViewModel.swift
//  mvvmRecetas
//
//  Created by Celia Rascón García on 28/2/25.
//


import Foundation

class DetalleViewModel: ObservableObject {
    @Published var receta: Recetas
    
    init(receta: Recetas) {
        self.receta = receta
    }
}
