//
//  PokemonDetailInfoProtocols.swift
//  practica-mvp-interactor
//
//  Created by Agustin Chinchilla on 12/01/2022.
//

import Foundation
import Alamofire


protocol PokemonDetailInfoDataSourceProtocol {
    func GoToInfo<T: Decodable>(responseType: T.Type , method: HTTPMethod , endpoint: String , completionHandler:@escaping(_ status:Bool , _ data : T?)->())
}

protocol PokemonDetailInfoRepositoryProtocol{
    func fetchView(success: @escaping (PokemonDetailInfoDTO)->Void, failure: @escaping (FailedApi)->Void)
}
protocol PokemonDetailInfoInteractorProtocol{
    func fetchView(success: @escaping (PokemonDetailInfoDTO)->Void, failure: @escaping (FailedApi)->Void)
}

protocol PokemonDetailInfoPresenterProtocol{
    var view: PokemonDetailInfoViewProtocol? {get set}

}

protocol PokemonDetailInfoViewProtocol{
    func setupInfoPokemon(_ pokemon : PokemonDetailInfoDTO)
}
