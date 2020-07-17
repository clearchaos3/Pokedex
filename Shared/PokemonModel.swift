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
    let types: [slot]
    let stats: [stats]
    let abilities: [abilities]
}

struct sprites : Decodable {
    let front_default: String
}

struct type : Decodable {
    let name: String
    let url: String
}

struct slot : Decodable {
    let slot: Int
    let type: type
}

struct stat : Decodable {
    let name: String
}

struct stats : Decodable {
    let base_stat: Int
    let stat : stat
}

struct abilities : Decodable {
    let ability: ability
}

struct ability : Decodable {
    let name: String
}
