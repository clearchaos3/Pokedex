//
//  SpeciesModel.swift
//  Pokedex
//
//  Created by Ryan Lee on 7/18/20.
//

import Foundation

struct SpeciesJSON : Decodable {
    let id: Int
    let flavor_text_entries: [flavor_text]
}

struct flavor_text : Decodable {
    let flavor_text: String
    let language: language
}

struct language : Decodable {
    let name: String
}
