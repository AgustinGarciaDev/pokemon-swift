//
//  ViewProtocols.swift
//  practica-mvp-interactor
//
//  Created by Agustin Chinchilla on 04/01/2022.
//

import Foundation
import Alamofire


protocol ViewPresenterProtocol{
    var view: ViewViewProtocol? {get set}
    func viewIsReady()
}

protocol ViewViewProtocol {
    func presentErrorScreen()
    func reloadTable()
}

protocol ViewDataSourceProtocol {
    func GoToInfo<T: Decodable>(responseType: T.Type , method: HTTPMethod, completionHandler:@escaping(_ status:Bool , _ data : T?)->())
}

protocol ViewInteractorProtocol {
    func fetchView(success: @escaping (ViewPokemonDTO)->Void, failure: @escaping (FailedApi)->Void)

}

protocol ViewRepositoryProtocol{
    
    func fetchView(success: @escaping (ViewPokemonDTO)->Void, failure: @escaping (FailedApi)->Void)
}