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
        label.text = "Health"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(13)
        return label
    }()
    var numberHp:UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = label.font.withSize(22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var cardOne:UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .center
        view.axis = .vertical
        return view
    }()
     
    var imgOne : UIImageView = {
        let viewImg = UIImageView()
        viewImg.translatesAutoresizingMaskIntoConstraints = false
        viewImg.image = UIImage(systemName: "waveform.path.ecg")
        viewImg.tintColor = .systemGreen
        return viewImg
    }()
    
    var viewOne : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 2
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 1
        return view
    }()
    
    var viewTwo : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 2
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 1
        return view
    }()
    
    var textAttack:UILabel = {
        let label = UILabel()
        label.text = "Attack"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(13)
        return label
    }()
    var numberAttack:UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = label.font.withSize(22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var cardTwo:UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .center
        view.axis = .vertical
        return view
    }()
     
    var imgTwo : UIImageView = {
        let viewImg = UIImageView()
        viewImg.translatesAutoresizingMaskIntoConstraints = false
        viewImg.image = UIImage(systemName: "bolt.fill")
        viewImg.tintColor = .systemYellow
        return viewImg
    }()

    
    required init(pokemonStats: [Stats?]){
        self.pokemonStats = pokemonStats
        super.init(frame: CGRect.zero)
        self.setUpComponent()
        self.setUpConstraints()
      }
    
    func setUpComponent(){
        self.addSubview(viewOne)
        viewOne.addSubview(cardOne)
        self.numberHp.text = pokemonStats[0]?.baseStat?.description
        self.cardOne.addArrangedSubview(imgOne)
        self.cardOne.addArrangedSubview(textHp)
        self.cardOne.addArrangedSubview(numberHp)
        
        self.addSubview(viewTwo)
        viewTwo.addSubview(cardTwo)
        self.numberAttack.text = pokemonStats[1]?.baseStat?.description
        self.cardTwo.addArrangedSubview(imgTwo)
        self.cardTwo.addArrangedSubview(textAttack)
        self.cardTwo.addArrangedSubview(numberAttack)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            viewOne.topAnchor.constraint(equalTo: self.topAnchor , constant: 10),
            viewOne.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            viewOne.widthAnchor.constraint(equalToConstant: 70),
            viewOne.heightAnchor.constraint(equalToConstant: 110)
        ])
        NSLayoutConstraint.activate([
            cardOne.topAnchor.constraint(equalTo: self.topAnchor , constant: 10),
           // cardOne.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            cardOne.widthAnchor.constraint(equalToConstant: 70),
            cardOne.heightAnchor.constraint(equalToConstant: 110)
        ])
        
        NSLayoutConstraint.activate([
            imgOne.widthAnchor.constraint(equalToConstant: 30),
            imgOne.heightAnchor.constraint(equalToConstant: 30),
            imgOne.topAnchor.constraint(equalTo: cardOne.topAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            viewTwo.topAnchor.constraint(equalTo: self.topAnchor , constant: 10),
            viewTwo.leadingAnchor.constraint(equalTo: viewOne.trailingAnchor, constant: 20),
            viewTwo.widthAnchor.constraint(equalToConstant: 70),
            viewTwo.heightAnchor.constraint(equalToConstant: 110)
        ])
        
        NSLayoutConstraint.activate([
            cardTwo.topAnchor.constraint(equalTo: self.topAnchor , constant: 10),
            cardTwo.widthAnchor.constraint(equalToConstant: 70),
            cardTwo.heightAnchor.constraint(equalToConstant: 110)
        ])
        
        NSLayoutConstraint.activate([
            imgTwo.widthAnchor.constraint(equalToConstant: 30),
            imgTwo.heightAnchor.constraint(equalToConstant: 30),
            imgTwo.topAnchor.constraint(equalTo: cardTwo.topAnchor, constant: 10)
        ])
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
  
}
