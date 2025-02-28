//
//  DetalleView.swift
//  mvvmNoticias
//
//  Created by Celia Rascón García on 28/2/25.
//

import SwiftUI

struct DetalleView: View {
    @StateObject var viewModel: DetalleViewModel

    init(noticia: Noticias) {
        _viewModel = StateObject(wrappedValue: DetalleViewModel(noticia: noticia))
    }

    var body: some View {
        ScrollView {
            VStack {
                // Imagen de la noticia
                AsyncImage(url: URL(string: viewModel.noticia.urlToImage ?? "")) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(height: 250)
                        .cornerRadius(12)
                } placeholder: {
                    ProgressView()
                }

                // Título de la noticia
                Text(viewModel.noticia.title)
                    .font(.largeTitle)
                    .bold()
                    .padding()

                // Descripción de la noticia
                Text(viewModel.noticia.description)
                    .font(.body)
                    .padding()
            }
        }
        .navigationTitle("Detalle Noticia")
    }
}

