//
//  PeliculaViewModel.swift
//  ACT3_U5_DINT
//

import Foundation
import Combine


class PeliculaViewModel: ObservableObject {
    @Published var movies: [Pelicula] = []
    @Published var searchText: String = ""
    private var cancellables = Set<AnyCancellable>()
    
    private let apiKey = "7503ee2abe08e9e8a580a457089cdff6"
    private let baseURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=7503ee2abe08e9e8a580a457089cdff6&language=es-ES"
    
    init() {
        fetchMovies()
    }
    
    func fetchMovies() {
        guard let url = URL(string: baseURL) else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: PeliculaResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { response in
                self.movies = response.results
            })
            .store(in: &cancellables)
    }
    
    var filtradasPelicula: [Pelicula] {
        if searchText.isEmpty {
            return movies
        } else {
            return movies.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
