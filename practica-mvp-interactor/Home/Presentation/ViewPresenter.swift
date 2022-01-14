//
//  ViewPresenter.swift
//  practica-mvp-interactor
//
//  Created by Agustin Chinchilla on 04/01/2022.
//

import Foundation
import UIKit

class ViewPresenter: NSObject, ViewPresenterProtocol{
  
    
    var view: ViewViewProtocol?
    private let interactor: ViewInteractorProtocol
    
    
    init(interactor:ViewInteractorProtocol){
        self.interactor = interactor
    }
    
    
    func viewIsReady() {
        
        interactor.fetchView{ dto in
            self.view?.listPokemon(dto)
            DispatchQueue.main.async {
                self.view?.reloadTable()
            }
        }failure:{ (error) in
            print(error)
            self.view?.presentErrorScreen()
        }
    }
}

