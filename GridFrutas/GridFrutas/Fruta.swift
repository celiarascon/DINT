//
//  Frutas.swift
//  GridFrutas
//
//  Created by Celia Rascón García on 23/2/25.
//
import Foundation

struct Fruta: Identifiable {
    var id = UUID() 
    var nombre: String
    var imagen: String
    var descripcion: String
}

extension Fruta {
    static var datosFrutas = [
        Fruta(nombre: "Kaki", imagen: "kaki", descripcion: "El kaki es una fruta de color anaranjado brillante, dulce y jugosa, con una textura suave. Se consume fresca o deshidratada, y tiene un sabor muy similar al del durazno."),
        Fruta(nombre: "Kiwi", imagen: "kiwi", descripcion: "El kiwi es una fruta pequeña, con piel marrón y peluda, y carne verde brillante llena de pequeñas semillas negras. Es muy ácido, pero delicioso y lleno de vitamina C."),
        Fruta(nombre: "Mango", imagen: "mango", descripcion: "El mango es una fruta tropical, jugosa y de sabor dulce, con pulpa fibrosa y un gran hueso en su interior. Se puede comer fresca, en jugos o como parte de ensaladas y postres."),
        Fruta(nombre: "Manzana", imagen: "manzana", descripcion: "La manzana es una de las frutas más comunes y populares. Tiene una piel crujiente y jugosa, con una variedad de colores como rojo, verde y amarillo. El sabor puede ser dulce o ácido, dependiendo del tipo."),
        Fruta(nombre: "Pera", imagen: "pera", descripcion: "La pera es una fruta jugosa, dulce y suave con una piel que varía entre amarillo, verde o rojo. Su carne es suave y ligeramente arenosa, ideal para comer fresca o en postres."),
        Fruta(nombre: "Piña", imagen: "piña", descripcion: "La piña es una fruta tropical con una cáscara gruesa y espinosa, pero con una pulpa jugosa, dulce y refrescante. Es ideal para consumir fresca, en jugos, o en platos de frutas."),
        Fruta(nombre: "Plátano", imagen: "platano", descripcion: "El plátano es una fruta alargada de color amarillo cuando está madura. Su carne es dulce y suave, siendo una excelente fuente de potasio. Es ideal para consumir fresco o en batidos, además de ser un ingrediente común en muchas recetas.")
        ]
}
