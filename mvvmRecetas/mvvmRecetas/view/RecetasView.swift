//
//  Recetas.swift
//  mvvmRecetas
//
//  Created by Celia Rascón García on 28/2/25.
//

import SwiftUI


struct RecetasView: View {
    @EnvironmentObject var login: LoginViewModel
    @ObservedObject var viewModel: RecetasViewModel

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.recetas.isEmpty {
                    ProgressView()
                } else {
                    TextField("Buscar receta...", text: $viewModel.searchText)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                            ForEach(viewModel.filtradasPelicula) { receta in
                                NavigationLink(destination: DetalleView(receta: receta)) {
                                    HStack {
                                        AsyncImage(url: URL(string: receta.urlToImage ?? "")) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 100, height: 150)
                                        
                                        VStack(alignment: .leading) {
                                            Text(receta.title)
                                                .font(.headline)
                                            Text(receta.category)
                                                .font(.subheadline)
                                        }
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            viewModel.toggleFavorite(for: receta)
                                        }) {
                                            Image(systemName: receta.isFavorite ? "heart.fill" : "heart")
                                                .foregroundColor(receta.isFavorite ? .red : .gray)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .navigationTitle("Recetas🍽️")
                }
            }
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}
