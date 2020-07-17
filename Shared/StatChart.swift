//
//  StatChart.swift
//  Pokedex
//
//  Created by Ryan Lee on 7/17/20.
//

import SwiftUI

struct StatChart: View {
    var hp: Int
    var attack: Int
    var defense: Int
    var specialAttack: Int
    var specialDefense: Int
    var speed: Int
    var size: CGFloat = 5
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("HP")
                    .font(.caption)
                    .frame(width: 50, height: size, alignment: .leading)
                Capsule()
                    .frame(width: CGFloat(hp)/3, height: size)
                    .foregroundColor(.red)
            }
            HStack {
                Text("Attack")
                    .font(.caption)
                    .frame(width: 50, height: size, alignment: .leading)
                Capsule()
                    .frame(width: CGFloat(attack)/3, height: size)
                    .foregroundColor(.orange)
            }
            HStack {
                Text("Defense")
                    .font(.caption)
                    .frame(width: 50, height: size, alignment: .leading)
                Capsule()
                    .frame(width: CGFloat(defense)/3, height: size)
                    .foregroundColor(.yellow)
            }
            HStack {
                Text("Sp. Atk")
                    .font(.caption)
                    .frame(width: 50, height: size, alignment: .leading)
                Capsule()
                    .frame(width: CGFloat(specialAttack)/3, height: size)
                    .foregroundColor(.blue)
            }
            HStack {
                Text("Sp. Def")
                    .font(.caption)
                    .frame(width: 50, height: size, alignment: .leading)
                Capsule()
                    .frame(width: CGFloat(specialDefense)/3, height: size)
                    .foregroundColor(.green)
            }
            HStack {
                Text("Speed")
                    .font(.caption)
                    .frame(width: 50, height: size, alignment: .leading)
                Capsule()
                    .frame(width: CGFloat(speed)/3, height: size)
                    .foregroundColor(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
            }
        }
    }
}

struct StatChart_Previews: PreviewProvider {
    static var previews: some View {
        StatChart(hp: 78, attack: 84, defense: 78, specialAttack: 109, specialDefense: 205, speed: 100)
    }
}
