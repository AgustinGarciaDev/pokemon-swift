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
    var dtoPokemon : ViewPokemonDTO?
    private let interactor: ViewInteractorProtocol
    
    
    init(interactor:ViewInteractorProtocol){
        self.interactor = interactor
    }
    
    
    func viewIsReady() {
        
        interactor.fetchView{ dto in
            self.dtoPokemon = dto
            DispatchQueue.main.async {
                self.view?.reloadTable()
            }
        }failure:{ (error) in
            print("error")
            self.view?.presentErrorScreen()
        }
    }
}

extension ViewPresenter : UITableViewDataSource, UITableViewDelegate{
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
         
         return self.dtoPokemon?.results.count ?? 0
         
     }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
       
        let pokemon = dtoPokemon?.results[indexPath.row]
        cell.titulo.text = pokemon?.name
       return cell
    
   }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

}
