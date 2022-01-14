//
//  CustomCell.swift
//  practica-mvp-interactor
//
//  Created by Agustin Chinchilla on 06/01/2022.
//

import UIKit

class CustomCell: UITableViewCell {

    var pokemon : ViewPokemonInfoDTO?
    var btnDelegate : btnCellProtocol?
    
    private lazy var icono : UIImageView = {
        let imgTrack = UIImageView()
        imgTrack.image = UIImage(named: "audioTrack")
        imgTrack.backgroundColor = .red
        imgTrack.translatesAutoresizingMaskIntoConstraints = false
        return imgTrack
    }()
    
     lazy var titulo : UILabel = {
        let lbl = UILabel()
        lbl.text = "Titulo del pokemon"
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var btnViewPokemon : UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("View", for: .normal)
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
             icono.leadingAnchor.constraint(equalTo: leadingAnchor, constant:25),
             icono.widthAnchor.constraint(equalTo: icono.heightAnchor)
         
         ])
        addSubview(titulo)
        NSLayoutConstraint.activate([
           titulo.topAnchor.constraint(equalTo: topAnchor, constant: 5),
           titulo.leadingAnchor.constraint(equalTo: icono.trailingAnchor , constant: 30)
        ])
        addSubview(btnViewPokemon)
        btnViewPokemon.addTarget(self, action: #selector(navegatePokemon), for: .touchUpInside)
        NSLayoutConstraint.activate([
            btnViewPokemon.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            btnViewPokemon.leadingAnchor.constraint(equalTo: titulo.trailingAnchor, constant: 80)
        ])
    }
    @objc func navegatePokemon() {
        btnDelegate?.buttonTouchedOnCell(celda: self)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
