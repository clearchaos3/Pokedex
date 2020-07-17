//
//  TypeView.swift
//  Pokedex
//
//  Created by Ryan Lee on 7/15/20.
//

import SwiftUI

struct TypeView: View {
    var type: String
    var body: some View {
        switch type {
        case "Normal": Text(type ?? "").foregroundColor(.gray)
        case "Fire": Text(type ?? "").foregroundColor(.orange)
        case "Water": Text(type ?? "").foregroundColor(.blue)
        case "Grass": Text(type ?? "").foregroundColor(.green)
        case "Flying": Text(type ?? "").foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
        case "Fighting": Text(type ?? "").foregroundColor(.red)
        case "Poison": Text(type ?? "").foregroundColor(Color(#colorLiteral(red: 0.8472194076, green: 0.2053607106, blue: 0.8379610181, alpha: 1)))
        case "Electric": Text(type ?? "").foregroundColor(.yellow)
        case "Ground": Text(type ?? "").foregroundColor(Color(#colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)))
        case "Rock": Text(type ?? "").foregroundColor(Color(#colorLiteral(red: 0.8372225165, green: 0.8325203061, blue: 0.6635807157, alpha: 1)))
        case "Psychic": Text(type ?? "").foregroundColor(Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
        case "Ice": Text(type ?? "").foregroundColor(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
        case "Bug": Text(type ?? "").foregroundColor(Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)))
        case "Ghost": Text(type ?? "").foregroundColor(.purple)
        case "Steel": Text(type ?? "").foregroundColor(Color(#colorLiteral(red: 0, green: 0.479084909, blue: 0.6649822593, alpha: 1)))
        case "Dragon": Text(type ?? "").foregroundColor(.blue)
        case "Dark": Text(type ?? "").foregroundColor(.black)
        case "Fairy": Text(type ?? "").foregroundColor(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
        default: Text(type ?? "")
        }
    }
}

struct TypeView_Previews: PreviewProvider {
    static var previews: some View {
        TypeView(type: "grass")
    }
}
