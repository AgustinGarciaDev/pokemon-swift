//
//  PokemonDetailInfoRepository.swift
//  practica-mvp-interactor
//
//  Created by Agustin Chinchilla on 12/01/2022.
//

import Foundation
class PokemonDetailInfoRepository : PokemonDetailInfoRepositoryProtocol{
    
    
    let dataSource : PokemonDetailInfoDataSource
    var urlPokemon : URL?
    init (dataSource:PokemonDetailInfoDataSource , urlPokemon:URL?){
        self.dataSource = dataSource
        self.urlPokemon = urlPokemon
    }
    
    func fetchView(success: @escaping (PokemonDetailInfoDTO) -> Void, failure: @escaping (FailedApi) -> Void) {
        dataSource.GoToInfo(responseType: PokemonDetailInfoDTO.self, method: .get, endpoint: urlPokemon!.absoluteString ) {
            status, data in
                
                guard let dto = data  else {
                    failure(FailedApi.errorCallApi)
                    return
                }
            success(dto)
        }
        
      
    }
       
}
