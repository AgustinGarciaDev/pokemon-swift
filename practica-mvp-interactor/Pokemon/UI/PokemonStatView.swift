//
//  PokemonStatView.swift
//  practica-mvp-interactor
//
//  Created by Agustin Chinchilla on 13/01/2022.
//

import UIKit

class PokemonStatView: UIView {

    var pokemonStats: [Stats?]

    var textHp:UILabel = {
        let label = UILabel()
        label.text = "hp"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var numberHp:UILabel = {
        let label = UILabel()
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var cardOne:UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.alignment = .center
        view.axis = .vertical
        return view
    }()
    
    required init(pokemonStats: [Stats?]){
        self.pokemonStats = pokemonStats
        super.init(frame: CGRect.zero)
        self.setUpComponent()
        self.setUpConstraints()
      }
    
    func setUpComponent(){
        self.addSubview(cardOne)
        
        self.numberHp.text = pokemonStats[0]?.baseStat?.description

        self.cardOne.addArrangedSubview(textHp)
        self.cardOne.addArrangedSubview(numberHp)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            cardOne.topAnchor.constraint(equalTo: self.topAnchor , constant: 10),
            cardOne.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            cardOne.widthAnchor.constraint(equalToConstant: 100),
            cardOne.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
  
}
