//
//  ContentView.swift
//  Shared
//
//  Created by Ryan Lee on 7/13/20.
//

import SwiftUI
import KingfisherSwiftUI

struct ContentView: View {
    @State var dexNumber = 1
    @State var pokemonName = ""
    @State var image = ""
    @State var weight = 0.0
    @State var height = 0.0
    @State var feet = 0
    @State var inches = 0
    @State var slot = 0
    @State var type1 = ""
    @State var type2 = ""

    func getPokemonData(id: Int){
        
        let jsonURLString = "https://pokeapi.co/api/v2/pokemon/" + String(id)
        // make URL
        guard let url = URL(string: jsonURLString) else { return}
        // create a session
        URLSession.shared.dataTask(with: url) { (data, response, error) in
        // check for error
        if error != nil {
            print(error!.localizedDescription)
        }
        // check for 200 OK status from dataTask
        guard let data = data else { return }
        do {
            let pokemonResults = try JSONDecoder().decode(PokemonJSON.self, from: data)
            image = pokemonResults.sprites.front_default
            dexNumber = pokemonResults.id
            pokemonName = pokemonResults.name
            weight = Double(pokemonResults.weight) / 4.536
            height = Double(pokemonResults.height) * 3.937
            feet = Int(round(height / 12.0))
            inches = Int(height.truncatingRemainder(dividingBy: 12.0))
            type1 = pokemonResults.types[0].type.name
            type2 = pokemonResults.types[1].type.name
        } catch let err {
            print ("Json Err", err)
        }
        // start the session
        }.resume()
    }
    
    var body: some View {
        HStack{
            KFImage(URL(string: image))
                .resizable()
                .frame(width: 100, height: 100)
            VStack {
                Text(pokemonName.capitalized).font(.headline)
                HStack {
                    Text(String(format: "%.1f", weight) + " lbs")
                    Text(String(feet) + "\' " + String(inches) + "\"")
                }
                .font(.subheadline)
                TypeView(type1: type1, type2: type2)
            }
        }
        .onAppear{getPokemonData(id: dexNumber)}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//PokemonJSON(id: 1,
//            name: "bulbasaur",
//            sprites: Pokedex.sprites(front_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"),
//            weight: 69,
//            height: 7,
//            types: [Pokedex.slot(slot: 1, type: Pokedex.type(name: "grass", url: "https://pokeapi.co/api/v2/type/12/")),
//                    Pokedex.slot(slot: 2, type: Pokedex.type(name: "poison", url: "https://pokeapi.co/api/v2/type/4/"))])
