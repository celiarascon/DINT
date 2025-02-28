//
//  Pelicula.swift
//  mvvmPeliculas
//
//  Created by Celia Rascón García on 27/2/25.
//


import Foundation

struct PeliculasResponse: Decodable {
    var results: [Pelicula]
}


struct Pelicula: Decodable, Identifiable {
    var id: Int
    var title: String
    var overview: String
    var poster_path: String
    var vote_average: Double
}
