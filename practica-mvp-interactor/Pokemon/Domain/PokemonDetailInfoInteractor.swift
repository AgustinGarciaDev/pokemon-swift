//
//  PokemonDetailInfoInteractor.swift
//  practica-mvp-interactor
//
//  Created by Agustin Chinchilla on 12/01/2022.
//

import Foundation


class PokemonDetailInfoInteractor : PokemonDetailInfoInteractorProtocol{
    
    private let repository: PokemonDetailInfoRepositoryProtocol
    
    init(repository:PokemonDetailInfoRepositoryProtocol){
        self.repository = repository
    }
    
    func fetchView(success: @escaping (PokemonDetailInfoDTO) -> Void, failure: @escaping (FailedApi) -> Void) {
        repository.fetchView(){ dto in
            success(dto)
            
        }failure: { error in
            print(error)
        }
    }
    
    
}
