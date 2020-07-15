//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Ryan Lee on 7/13/20.
//

import Foundation

struct PokemonJSON : Decodable {
    let id: Int
    let name: String
    let sprites: sprites
    let weight: Int
    let height: Int
//    let types: [type]
}

struct sprites : Decodable {
    let front_default: String
}

//struct type: Decodable {
//    let name: String
//}
