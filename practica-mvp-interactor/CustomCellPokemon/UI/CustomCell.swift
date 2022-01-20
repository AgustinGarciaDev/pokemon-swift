//
//  CustomCell.swift
//  practica-mvp-interactor
//
//  Created by Agustin Chinchilla on 06/01/2022.
//

import UIKit

class CustomCell: UITableViewCell {

    var btnDelegate : btnCellProtocol?
    var pokemonInfo: PokemonDetailInfoDTO?
    // MARK: - ViewProtocol

   
    
    
    lazy var icono : UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = nil
        return imgView
    }()
    
     lazy var titulo : UILabel = {
        let lbl = UILabel()
        lbl.text = "Titulo del pokemon"
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    lazy var type : UILabel = {
       let lbl = UILabel()
       lbl.text = "Type Pokemon"
       lbl.font = UIFont.systemFont(ofSize: 15)
       lbl.textColor = .black
       lbl.translatesAutoresizingMaskIntoConstraints = false
       return lbl
   }()
   
    
    private lazy var btnViewPokemon : UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Discover", for: .normal)
        btn.backgroundColor = .systemPurple
        btn.layer.cornerRadius = 10
        btn.setTitleColor( .white , for: .normal)
        return btn
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
     
     
        
        
        contentView.isUserInteractionEnabled = false

        addSubview(icono)
         NSLayoutConstraint.activate([
             icono.topAnchor.constraint(equalTo: topAnchor, constant: 5),
             icono.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
             icono.leadingAnchor.constraint(equalTo: leadingAnchor, constant:5),
             icono.widthAnchor.constraint(equalToConstant: 90),
             icono.heightAnchor.constraint(equalToConstant:50)
         
         ])
        addSubview(titulo)
        NSLayoutConstraint.activate([
           titulo.topAnchor.constraint(equalTo: topAnchor, constant: 5),
           titulo.leadingAnchor.constraint(equalTo: icono.trailingAnchor , constant: 30),
           titulo.widthAnchor.constraint(equalToConstant: 100)
        ])
        addSubview(type)
        NSLayoutConstraint.activate([
            type.topAnchor.constraint(equalTo: titulo.bottomAnchor,constant: 10),
            type.leadingAnchor.constraint(equalTo: icono.trailingAnchor , constant: 30),
            type.widthAnchor.constraint(equalToConstant: 100)

        ])
        addSubview(btnViewPokemon)
        btnViewPokemon.addTarget(self, action: #selector(navegatePokemon), for: .touchUpInside)
        NSLayoutConstraint.activate([
            btnViewPokemon.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            btnViewPokemon.leadingAnchor.constraint(equalTo: titulo.trailingAnchor, constant: 80),
            btnViewPokemon.widthAnchor.constraint(equalToConstant: 80)

        ])
  
    }
    
    func configureImage(with url: URL){
        URLSession.shared.dataTask(with: url){ [weak self] data, __ ,error  in
            guard let data = data , error == nil else {
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data:data)
                self?.icono.image = nil
                self?.icono.image = image
            }
        }.resume()
    }
    @objc func navegatePokemon() {
        btnDelegate?.buttonTouchedOnCell(celda: self)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


