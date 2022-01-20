//
//  PokemonDetailInfoPresenter.swift
//  practica-mvp-interactor
//
//  Created by Agustin Chinchilla on 12/01/2022.
//

import Foundation


class PokemonDetailInfoPresenter:  PokemonDetailInfoPresenterProtocol{
    var view: PokemonDetailInfoViewProtocol?

    private let interactor: PokemonDetailInfoInteractorProtocol
    
    init(interactor:PokemonDetailInfoInteractorProtocol){
        self.interactor = interactor
    }
    
    func viewIsReady(){
        self.interactor.fetchView(){ dto in
            self.view?.setupInfoPokemon(dto)
        }failure:{ (error) in
            print(error)
        }
    }
}

