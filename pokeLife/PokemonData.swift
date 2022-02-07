//
//  PokemonData.swift
//  pokeLife
//
//  Created by Gustavo rodrigues on 2022/2/7.
//

import Foundation


struct PokemonData: Codable {
    let results: [EachPokemonData]?

}

struct EachPokemonData: Codable{
    let name: String
    let url: String
}


//  results[0].name -- results
