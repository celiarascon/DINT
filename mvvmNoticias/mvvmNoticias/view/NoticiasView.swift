//
//  NoticiasView.swift
//  mvvmNoticias
//
//  Created by Celia Rascón García on 28/2/25.
//

import SwiftUI

struct NoticiasView: View {
    @EnvironmentObject var login: LoginViewModel  // 🔹 Correcto
    @StateObject var viewModel = NoticiasViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.noticias.isEmpty {
                    ProgressView()
                } else {
                    List(viewModel.noticias, id: \.id) { noticia in
                        NavigationLink(destination: DetalleView(noticia: noticia)) {
                            HStack {
                                AsyncImage(url: URL(string: noticia.urlToImage ?? "")) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 100, height: 150)

                                VStack(alignment: .leading) {
                                    Text(noticia.title)
                                        .font(.headline)
                                    Text(noticia.publishedAt)
                                        .font(.subheadline)
                                }
                            }
                        }
                    }
                    .navigationTitle("Noticias")
                }
            }
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}
