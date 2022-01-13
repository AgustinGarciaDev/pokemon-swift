//
//  ViewRepository.swift
//  practica-mvp-interactor
//
//  Created by Agustin Chinchilla on 04/01/2022.
//

import Foundation


class ViewRepository : ViewRepositoryProtocol {
  
    
    let dataSource : ViewDataSourceProtocol
    
    init (dataSource:ViewDataSourceProtocol){
        self.dataSource = dataSource
    }
    
    func fetchView(success: @escaping (ViewPokemonDTO) -> Void, failure: @escaping (FailedApi) -> Void) {
        dataSource.GoToInfo(responseType: ViewPokemonDTO.self, method: .get){ status , data in

            guard let dto = data else {return}
            success(dto)
            
        }
    }
    
}
