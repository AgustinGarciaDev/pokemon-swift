//
//  CustomCell.swift
//  practica-mvp-interactor
//
//  Created by Agustin Chinchilla on 06/01/2022.
//

import UIKit

class CustomCell: UITableViewCell {

    var pokemon : ViewPokemonDTO?
    
    var icono : UIImageView = {
        let imgTrack = UIImageView()
        imgTrack.image = UIImage(named: "audioTrack")
        imgTrack.backgroundColor = .red
        imgTrack.translatesAutoresizingMaskIntoConstraints = false
        return imgTrack
    }()
    
    var titulo : UILabel = {
        let lbl = UILabel()
        lbl.text = "Titulo del pokemon"
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(icono)
         NSLayoutConstraint.activate([
             icono.topAnchor.constraint(equalTo: topAnchor, constant: 5),
             icono.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
             icono.leadingAnchor.constraint(equalTo: leadingAnchor, constant:25),
             icono.widthAnchor.constraint(equalTo: icono.heightAnchor)
         
         ])
        addSubview(titulo)
        NSLayoutConstraint.activate([
           titulo.topAnchor.constraint(equalTo: topAnchor, constant: 5),
           titulo.leadingAnchor.constraint(equalTo: icono.trailingAnchor , constant: 30)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
