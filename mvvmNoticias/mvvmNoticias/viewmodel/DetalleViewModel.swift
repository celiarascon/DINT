//
//  DetalleViewModel.swift
//  mvvmNoticias
//
//  Created by Celia Rascón García on 28/2/25.
//

import Foundation

class DetalleViewModel: ObservableObject {
    @Published var noticia: Noticias
    
    init(noticia: Noticias) {
        self.noticia = noticia
    }
}

