//
//  ViewController.swift
//  practica-mvp-interactor
//
//  Created by Agustin Chinchilla on 04/01/2022.
//

import UIKit

class ViewController: UIViewController, btnCellProtocol{

   
    // MARK: - ViewProtocol

    lazy var interactor: ViewInteractorProtocol = {
        ViewInteractor(repository: repository)
    }()
    
    lazy var repository : ViewRepositoryProtocol = {
      ViewRepository(dataSource: dataSource)
    }()
    lazy var dataSource : ViewDataSourceProtocol = {
        ViewDataSource()
    }()
    
    
    //MARK: - Properties
    
    var presenter : ViewPresenter?
    var pokemon: ViewPokemonDTO?
    
    //MARK: - UI Properties
    private lazy var textLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "App pokemon"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 33)
        return label
    }()
    
    private lazy var tablePokemon : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
       
        return table
    }()
    
     private lazy var textError : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Ocurrio un error y estamos trabajando para solucionarlo"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        label.isHidden = true
        return label
    }()
    

    override func viewDidLoad() {
       
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        self.presenter = ViewPresenter(interactor: interactor)
        self.presenter?.view = self
        self.addComponents()
        self.setupConstraints()
        presenter?.viewIsReady()
    }
    
    // MARK: -Helper functions
    
    func addComponents() {
        self.view.addSubview(textLabel)
        self.view.addSubview(textError)
        self.view.addSubview(tablePokemon)
        self.tablePokemon.register(CustomCell.self, forCellReuseIdentifier: "Cell")
        self.tablePokemon.dataSource = self
        self.tablePokemon.delegate =  self
    }
    
  
    
    private func setupConstraints(){
        
        let safeA = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: safeA.topAnchor , constant: 20 ),
            textLabel.centerXAnchor.constraint(equalTo: safeA.centerXAnchor),
            
        ])
        
        NSLayoutConstraint.activate([
            tablePokemon.topAnchor.constraint(equalTo: textLabel.bottomAnchor , constant: 50 ),
            tablePokemon.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tablePokemon.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tablePokemon.widthAnchor.constraint(equalToConstant: 350),
            tablePokemon.heightAnchor.constraint(equalToConstant: 700)
        ])
        
        NSLayoutConstraint.activate([
            textError.topAnchor.constraint(equalTo: textLabel.bottomAnchor , constant: 20 ),
            textError.centerXAnchor.constraint(equalTo: safeA.centerXAnchor),
            textError.widthAnchor.constraint(equalToConstant: 250)
            
        ])
        
    }
    
}


extension ViewController: ViewViewProtocol, UITableViewDataSource, UITableViewDelegate {
    func listPokemon(_ jsonData: ViewPokemonDTO) {
        pokemon = jsonData
    }
    
    func changeView(_ celda: CustomCell) {
        
        let vc = PokemonDetailInfoViewController()
        vc.pokemonInfoUrl = celda.pokemon
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func presentErrorScreen() {
        self.view.backgroundColor = .red
        self.tablePokemon.isHidden = true
        self.textError.isHidden = false
        
    }
    
    func reloadTable() {
        self.tablePokemon.reloadData()
    }
    
    func buttonTouchedOnCell(celda: CustomCell) {
        self.changeView(celda)
    }
 
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // #warning Incomplete implementation, return the number of rows
            
        return  pokemon?.count ?? 0
            
    }
       
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
          let pokemon =  pokemon?.results[indexPath.row]
          
          cell.titulo.text = pokemon?.name
          cell.btnDelegate = self
          cell.pokemon = pokemon
          return cell
       
      }
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 70
       }
     
}
