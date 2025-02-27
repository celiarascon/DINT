//
//  Modelo2.swift
//  RepasoExamen
//
//  Created by Celia Rascón García on 27/2/25.
//

import Foundation

struct Modelo2 : Decodable{
    var data: [UserList]
}

struct User: Decodable {
    var data: UserList
}

struct UserList: Decodable {
    var id: Int
    var first_name: String
    var email: String
    var avatar: String
}

