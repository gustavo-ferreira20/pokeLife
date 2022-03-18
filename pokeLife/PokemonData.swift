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

struct IndividualpokemonInfo: Codable{
    let types: [PokemonCharacteristics]
    let name: String
    let sprites: PokeImage
}

struct PokemonCharacteristics: Codable{
    let type: PokemonType
    let slot: Int
}

struct PokeImage: Codable{
    let front_default: String
}

struct PokemonType: Codable{
    let name: String
}



//  results[0].name -- results
//types[0].type.name
//types[0].slot
// name
// sprites.back_default
