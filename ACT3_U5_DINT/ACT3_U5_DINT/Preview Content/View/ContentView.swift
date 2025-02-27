

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PeliculaViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    Text("🎬 Movies 🎬")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    TextField("Buscar película", text: $viewModel.searchText)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Peliculas mejor valoradas")
                        .font(.headline)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                            ForEach(viewModel.filtradasPelicula) { pelicula in
                                NavigationLink(destination: PeliculaDetalleView(pelicula: pelicula)) {
                                    VStack {
                                        ZStack(alignment: .topLeading) {
                                            if let url = pelicula.posterURL {
                                                AsyncImage(url: url) { image in
                                                    image.resizable().scaledToFit()
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                                .frame(width: 150, height: 225)
                                                .cornerRadius(10)
                                            }
                                            
                                            Text("\(pelicula.voteAverage, specifier: "%.1f")")
                                                .padding(8)
                                                .background(Circle().fill(Color("redCarpet")))
                                                .foregroundColor(.white)
                                                .font(.system(size: 14, weight: .bold))
                                                .padding(8)
                                        }
                                        
                                        Text(pelicula.title)
                                            .font(.headline)
                                            .foregroundColor(.black)
                                            .padding(.top, 5)
                                        
                                        if let genreIds = pelicula.genreIds, let firstGenreId = genreIds.first {
                                            HStack {
                                                Text(genreName(for: firstGenreId))
                                                    .padding(5)
                                                    .background(Color.gray.opacity(0.3))
                                                    .cornerRadius(5)
                                                    .foregroundColor(.black)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                }
                .background(
                    Image("fondo")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .opacity(0.1)
                )
            }
        }
    }
    
    func genreName(for id: Int) -> String {
        let genres = [
            28: "Acción", 12: "Aventura", 16: "Animación", 35: "Comedia", 80: "Crimen",
            99: "Documental", 18: "Drama", 10751: "Familiar", 14: "Fantasía", 36: "Historia",
            27: "Terror", 10402: "Música", 9648: "Misterio", 10749: "Romance", 878: "Ciencia ficción",
            10770: "Película de TV", 53: "Suspenso", 10752: "Bélica", 37: "Western"
        ]
        return genres[id] ?? "Desconocido"
    }

