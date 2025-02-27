//
//  Pelicula.swift
//  ACT3_U5_DINT
//


import SwiftUI
import Combine

struct Pelicula: Identifiable, Codable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let releaseDate: String
    let voteAverage: Double
    let genreIds: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview, releaseDate = "release_date", voteAverage = "vote_average", posterPath = "poster_path", genreIds = "genre_ids"
    }
    
    var posterURL: URL? {
        if let path = posterPath {
            return URL(string: "https://image.tmdb.org/t/p/w500" + path)
        }
        return nil
    }
}

struct PeliculaResponse: Codable {
    let results: [Pelicula]
}
