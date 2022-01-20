//
//  ViewInteractor.swift
//  practica-mvp-interactor
//
//  Created by Agustin Chinchilla on 04/01/2022.
//

import Foundation


class ViewInteractor : ViewInteractorProtocol {

    private let repository: ViewRepositoryProtocol
    var pokemonList = [PokemonDetailInfoDTO?]()
    init(repository: ViewRepositoryProtocol){
        self.repository = repository
    }
    
    
    func fetchView(success: @escaping ([PokemonDetailInfoDTO?]) -> Void, failure: @escaping (FailedApi) -> Void){
        
        repository.fetchView{(dto) in
          self.pokemonList.append(dto)
            success(self.pokemonList)
        }failure: { (error) in
            failure(.errorCallApi)
        }
        
    }
    
    
    
}
