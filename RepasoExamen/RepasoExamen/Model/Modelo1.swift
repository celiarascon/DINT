//
//  Modelo1.swift
//  RepasoExamen
//
//  Created by Celia Rascón García on 27/2/25.
//

import Foundation

struct Modelo1: Decodable {
    var id: Int
    var name: String
    var email: String
    var address: Address
}
struct Address: Decodable {
    var street: String
    var suite: String
    var city: String
    var geo: Geo
}
struct Geo: Decodable {
    var lat: String
    var lng: String
}
