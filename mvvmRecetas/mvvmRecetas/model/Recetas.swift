//
//  Recetas.swift
//  mvvmRecetas
//
//  Created by Celia Rascón García on 28/2/25.
//

struct RecetasResponse: Decodable {
    var meals: [Recetas] 
}

struct Recetas: Decodable, Identifiable {
    var id: String { idMeal }
    var idMeal: String
    var title: String
    var category: String
    var urlToImage: String?
    var isFavorite: Bool = false


  
    enum CodingKeys: String, CodingKey {
        case idMeal
        case title = "strMeal"
        case category = "strCategory"
        case urlToImage = "strMealThumb"
    }
}
