//
//  ViewInteractor.swift
//  practica-mvp-interactor
//
//  Created by Agustin Chinchilla on 04/01/2022.
//

import Foundation


class ViewInteractor : ViewInteractorProtocol {

    private let repository: ViewRepositoryProtocol
    
    init(repository: ViewRepositoryProtocol){
        self.repository = repository
    }
    
    
    func fetchView(success: @escaping (ViewPokemonDTO) -> Void, failure: @escaping (FailedApi) -> Void){
        
        repository.fetchView{(dto) in
            print("Recibo la data \(dto.count)")
            success(dto)
            
        }failure: { (error) in
            failure(.errorCallApi)
        }
        
    }
    
    
    
}
