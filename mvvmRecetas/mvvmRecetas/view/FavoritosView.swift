//
//  FavoritosView.swift
//  mvvmRecetas
//
//  Created by Celia Rascón García on 28/2/25.
//

import SwiftUI

struct FavoritosView: View {
    @EnvironmentObject var login: LoginViewModel
    @ObservedObject var viewModel: RecetasViewModel

    var body: some View {
        NavigationStack {
            if viewModel.recetas.filter({ $0.isFavorite }).isEmpty {
                Text("No tienes recetas favoritas")
                    .font(.headline)
                    .foregroundColor(.gray)
            } else {
                List {
                    ForEach(viewModel.recetas.filter { $0.isFavorite }) { receta in
                        NavigationLink(destination: DetalleView(receta: receta)) {
                            HStack {
                                AsyncImage(url: URL(string: receta.urlToImage ?? "")) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 50, height: 50)
                                .cornerRadius(8)
                                
                                VStack(alignment: .leading) {
                                    Text(receta.title)
                                        .font(.headline)
                                    Text(receta.category)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Favoritos ❤️")
            }
        }
    }
}
