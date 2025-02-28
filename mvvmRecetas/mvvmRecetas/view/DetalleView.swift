//
//  DetalleView.swift
//  mvvmRecetas
//
//  Created by Celia Rascón García on 28/2/25.
//

import SwiftUI

struct DetalleView: View {
    @StateObject var viewModel: DetalleViewModel

    init(receta: Recetas) {
        _viewModel = StateObject(wrappedValue: DetalleViewModel(receta: receta))
    }

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: viewModel.receta.urlToImage ?? "")) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(height: 250)
                        .cornerRadius(12)
                } placeholder: {
                    ProgressView()
                }

                Text(viewModel.receta.title)
                    .font(.largeTitle)
                    .bold()
                    .padding()

                Text(viewModel.receta.category)
                    .font(.body)
                    .padding()
            }
        }
        .navigationTitle("Detalle de las Recetas")
    }
}
