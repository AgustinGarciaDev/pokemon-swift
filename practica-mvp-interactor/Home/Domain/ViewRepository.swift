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
    
    func fetchView(success: @escaping (PokemonDetailInfoDTO) -> Void, failure: @escaping (FailedApi) -> Void) {
        dataSource.GoToInfo(responseType: ViewPokemonDTO.self, method: .get) { status , data in
            
            guard let dto = data  else {
                failure(FailedApi.errorCallApi)
                return
                
            }
           let listUrlPokemon = dto.results.map{$0.url}
           // success(dto)
            

            for item in listUrlPokemon {
                self.dataSource.GoToImage(responseType: PokemonDetailInfoDTO.self, method: .get , endpoint: item.absoluteString ){status,data in
                    guard let dto = data  else {
                        failure(FailedApi.errorCallApi)
                        return
                    }
                   success(dto)
                }
            }
          
        }
    }
    
}
