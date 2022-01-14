//
//  PokemonDetailInfoDTO.swift
//  practica-mvp-interactor
//
//  Created by Agustin Chinchilla on 12/01/2022.
//

import Foundation


struct PokemonDetailInfoDTO: Codable{
    let abilities : [Ability]?
    let forms : [Form]?
    let gameIndices : [GameIndex]?
    let heigth : Int?
    let id :Int?
    let name : String?
    let order : Int?
    let species : Specie?
    let sprites : Sprite?
    let stats: [Stats?]
    let types : [Types?]
    let weigth :Int?
    
    enum CodingKeys: String, CodingKey {
        case abilities
        case forms
        case gameIndices = "game_indices"
        case heigth
      //  case heldItems = "held_items"
        case id
       // case moves
        case name
        case order
       // case passType = "pass_type"
        case species
        case sprites
        case stats
        case types
        case weigth
    }
}

struct Ability : Codable {
    let name: String?
    let url : URL?
}

struct Form : Codable {
    let name: String?
    let url : URL?
}

struct GameIndex: Codable {
    let version : VersionInfo?
}

struct VersionInfo : Codable {
    let name: String?
    let url : URL?
}

struct Specie : Codable {
    let name: String?
    let url : URL?
}

struct Sprite:Codable {
    let backDefault : URL?
    let backFemale : URL?
    let backShiny : URL?
    let backShinyFemale : URL?
    let frontDefault : URL?
    let frontFemale : URL?
    let frontShiny : URL?
    let frontShinyFemale : URL?
    let other : OtherImagePokemon

    enum CodingKeys : String, CodingKey {
        case backDefault = "back_default"
        case backFemale  = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale  = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        case other
    }
}

struct OtherImagePokemon: Codable {
    let dreamWorl: DreamImage?
    let home: HomeImage?
    
    enum CodingKeys : String, CodingKey {
        case dreamWorl = "dream_worl"
        case home
    }
}

struct DreamImage: Codable {
    let frontDefault: URL?
    let frontFemale : URL?
    enum CodingKeys : String, CodingKey{
        case frontDefault = "front_default"
        case frontFemale  = "front_female"
    }
}

struct HomeImage: Codable {
    let frontDefault : URL?
    let frontFemale : URL?
    let frontShiny : URL?
    let frontShinyFemale : URL?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale  = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}

struct Stats : Codable{
    let baseStat :Int?
    let effort : Int?
    let stat : Stat?
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort
        case stat
        
    }
}
struct Stat : Codable{
    let name : String?
    let url : URL
}

struct Types:Codable{
    let slot : Int?
    let type : TypePokemon?
}

struct TypePokemon: Codable {
    let name : String?
    let url : URL
}


