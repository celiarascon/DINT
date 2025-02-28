//
//  Noticias.swift
//  mvvmNoticias
//
//  Created by Celia Rascón García on 28/2/25.
//

import Foundation

struct NoticiasResponse: Decodable {
    var articles: [Noticias]
}


struct Noticias: Decodable, Identifiable {
    var id: String { title } 
    var title: String
    var description: String
    var urlToImage: String?
    var publishedAt: String
}


