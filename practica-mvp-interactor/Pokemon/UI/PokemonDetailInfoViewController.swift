//
//  PokemonDetailInfoViewController.swift
//  practica-mvp-interactor
//
//  Created by Agustin Chinchilla on 10/01/2022.
//

import UIKit

class PokemonDetailInfoViewController: UIViewController{

    var pokemon : PokemonDetailInfoDTO?
    
    //MARK: - UI Properties
    private lazy var namePokemon : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 50)
        return label
    }()
    
    private lazy var imgPokemon : UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var cardAttack : PokemonStatView = {
        let view = PokemonStatView(pokemonStats: pokemon!.stats )
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        guard let pokemonName = pokemon?.name else {return}
        guard let pokemonImage = pokemon?.sprites?.other.home?.frontDefault?.absoluteString  else {return}
        namePokemon.text = pokemonName.uppercased()
        setImage(url: pokemonImage)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        setUpComponent()

    }
    
    private func setupConstraints(){
        
        let safeA = self.view.safeAreaLayoutGuide
        self.view.addSubview(namePokemon)
        NSLayoutConstraint.activate([
            namePokemon.topAnchor.constraint(equalTo: safeA.topAnchor , constant: 20 ),
            namePokemon.centerXAnchor.constraint(equalTo: safeA.centerXAnchor),
            
        ])
        self.view.addSubview(imgPokemon)
        NSLayoutConstraint.activate([
            imgPokemon.topAnchor.constraint(equalTo: namePokemon.bottomAnchor, constant: 20 ),
            imgPokemon.centerXAnchor.constraint(equalTo: safeA.centerXAnchor),
            imgPokemon.widthAnchor.constraint(equalToConstant: 200),
            imgPokemon.heightAnchor.constraint(equalToConstant: 200)
        ])
        self.view.addSubview(cardAttack)
        NSLayoutConstraint.activate([
            cardAttack.topAnchor.constraint(equalTo: imgPokemon.bottomAnchor, constant: 20 ),
            cardAttack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor , constant: 0),
            cardAttack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor , constant: 0),
            cardAttack.widthAnchor.constraint(equalToConstant: 200),
            cardAttack.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    

  
}


extension PokemonDetailInfoViewController{
 
    func setUpComponent(){
        self.setupConstraints()
    }
    
    func setImage( url: String) {
        guard let imageURL = URL(string: url) else { return }

        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.imgPokemon.image = image
            }
        }
    }
    
    
}
