//
//  ContentView.swift
//  Shared
//
//  Created by Ryan Lee on 7/13/20.
//

import SwiftUI
import KingfisherSwiftUI

struct ContentView: View {
    @State var dexNumber = 150
    @State var pokemonName = ""
    @State var image = ""
    @State var weight = 0.0
    @State var height = 0.0
    @State var feet = 0
    @State var inches = 0
    @State var slot = 0
    @State var type1 = ""
    @State var type2 = ""
    @State var hp = 0
    @State var attack = 0
    @State var defense = 0
    @State var specialAttack = 0
    @State var specialDefense = 0
    @State var speed = 0
    @State var ability1 = ""
    @State var ability2 = ""
    @State var flavorText = ""
    
    func getPokemonData(id: Int){
        
        let jsonURLString = "https://pokeapi.co/api/v2/pokemon/" + String(id)
        // make URL
        guard let url = URL(string: jsonURLString) else { return }
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
            pokemonName = pokemonResults.name.capitalized
            weight = Double(pokemonResults.weight) / 4.536
            height = Double(pokemonResults.height) * 3.937
            feet = Int(round(height / 12.0))
            inches = Int(height.truncatingRemainder(dividingBy: 12.0))
            type1 = pokemonResults.types[0].type.name.capitalized
            if (pokemonResults.types.count == 2){
                type2 = pokemonResults.types[1].type.name.capitalized
            } else {
                type2 = ""
            }
            ability1 = pokemonResults.abilities[0].ability.name.capitalized
            if (pokemonResults.abilities.count == 2){
                ability2 = pokemonResults.abilities[1].ability.name.capitalized
            }
            else{
                ability2 = ""
            }
            hp = pokemonResults.stats[0].base_stat
            attack = pokemonResults.stats[1].base_stat
            defense = pokemonResults.stats[2].base_stat
            specialAttack = pokemonResults.stats[3].base_stat
            specialDefense = pokemonResults.stats[4].base_stat
            speed = pokemonResults.stats[5].base_stat
            
            
        } catch let err {
            print ("Json Err", err)
        }
        // start the session
        }.resume()
    }
    
    func getSpeciesData(id: Int){
        
        let jsonURLString = "https://pokeapi.co/api/v2/pokemon-species/" + String(id)
        // make URL
        guard let url = URL(string: jsonURLString) else { return }
        // create a session
        URLSession.shared.dataTask(with: url) { (data, response, error) in
        // check for error
        if error != nil {
            print(error!.localizedDescription)
        }
        // check for 200 OK status from dataTask
        guard let data = data else { return }
        do {
            let speciesResults = try JSONDecoder().decode(SpeciesJSON.self, from: data)
            for (index, text) in speciesResults.flavor_text_entries.enumerated() {
                if (speciesResults.flavor_text_entries[index].language.name == "en"){
                    flavorText = text.flavor_text.replacingOccurrences(of: "\n", with: " ")
                }
            }
        } catch let err {
            print ("Json Err", err)
        }
        // start the session
        }.resume()
    }
    
    var body: some View {
        ZStack {
            Color(.white)
                .edgesIgnoringSafeArea(.all)
            VStack {
                    HStack{
                        KFImage(URL(string: image))
                            .resizable()
                            .frame(width: 100, height: 100)
                            
                        VStack {
                            HStack {
                                Text(pokemonName).font(.headline)
                                Text("#" + String(dexNumber)).font(.caption)
                            }
                            HStack {
                                Text(String(format: "%.1f", weight) + " lbs")
                                Text(String(feet) + "\' " + String(inches) + "\"")
                            }
                            .font(.subheadline)
                            HStack {
                                TypeView(type: type1)
                                TypeView(type: type2)
                            }
                        }
                    }
                    Text(flavorText).font(.caption)
                    VStack{
                        Text(ability2 == "" ? "Ability" : "Abilities")
                        Text(ability1).font(.caption)
                        Text(ability2).font(.caption)
                    }
                    .frame(width: 100, height: 120, alignment: .center)
                
                HStack {
                    StatChart(hp: hp, attack: attack, defense: defense, specialAttack: specialAttack, specialDefense: specialDefense, speed: speed)
                        .frame(width: 80, height: 120, alignment: .leading)
                }
                
                HStack {
                    Button(action: {
                            dexNumber -= 1
                            if(dexNumber < 1){
                                dexNumber = 1
                            }
                            getPokemonData(id: dexNumber)
                            getSpeciesData(id: dexNumber)
                    }){
                        Text("Previous")
                    }
                    Button(action: {
                            dexNumber += 1
                            getPokemonData(id: dexNumber)
                            getSpeciesData(id: dexNumber)
                    }){
                        Text("Next")
                    }
                }
            }
            .onAppear{
                getPokemonData(id: dexNumber)
                getSpeciesData(id: dexNumber)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
