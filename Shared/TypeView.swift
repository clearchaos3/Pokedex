//
//  TypeView.swift
//  Pokedex
//
//  Created by Ryan Lee on 7/15/20.
//

import SwiftUI

struct TypeView: View {
    @State var type1 = ""
    @State var type2 = ""
    var body: some View {
        HStack {
            switch type1 {
            case "grass": Text(type1.capitalized ?? "").foregroundColor(.green)
            default: Text(type1.capitalized ?? "")
            }
            
            switch type2 {
            case "poison": Text(type2.capitalized ?? "").foregroundColor(.purple)
            default: Text(type2.capitalized ?? "")
            }
        }
    }
}

struct TypeView_Previews: PreviewProvider {
    static var previews: some View {
        TypeView(type1: "grass", type2: "poison")
    }
}
