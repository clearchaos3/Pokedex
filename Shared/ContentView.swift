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
//    var types: [type] = []

    func getPokemonData(id: Int) -> String {
        
        let jsonURLString = "https://pokeapi.co/api/v2/pokemon/" + String(id)
        // make URL
        guard let url = URL(string: jsonURLString) else { return "" }
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
        } catch let err {
            print ("Json Err", err)
        }
        // start the session
        }.resume()
        return image
    }
    
    
    var body: some View {
        HStack{
            KFImage(URL(string: getPokemonData(id: dexNumber)))
                .resizable()
                .frame(width: 100, height: 100)
            VStack {
                Text(pokemonName.capitalized).font(.headline)
                HStack {
                    Text(String(format: "%.1f", weight) + " lbs").font(.subheadline)
                    Text("|")
                    Text(String(feet) + "\' " + String(inches) + "\"").font(.subheadline)
                }
                
                Text(pokemonName.capitalized).font(.caption2)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
