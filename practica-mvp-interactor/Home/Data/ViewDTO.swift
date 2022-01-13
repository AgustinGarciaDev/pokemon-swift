//
//  ViewDTO.swift
//  practica-mvp-interactor
//
//  Created by Agustin Chinchilla on 04/01/2022.
//

import Foundation


struct ViewPokemonDTO: Codable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [ViewPokemonInfoDTO]
}
struct  ViewPokemonInfoDTO: Codable {
    let name: String
    let url : URL
}
