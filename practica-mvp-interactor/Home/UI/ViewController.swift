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
    var pokemon = [PokemonDetailInfoDTO?]()
    
    //MARK: - UI Properties
  
    
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
        self.view.addSubview(textError)
        self.view.addSubview(tablePokemon)
        self.tablePokemon.register(CustomCell.self, forCellReuseIdentifier: "Cell")
        self.tablePokemon.dataSource = self
        self.tablePokemon.delegate =  self
    }
    
  
    
    private func setupConstraints(){
        
        let safeA = self.view.safeAreaLayoutGuide
        
        
        NSLayoutConstraint.activate([
            tablePokemon.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tablePokemon.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tablePokemon.widthAnchor.constraint(equalToConstant: 350),
            tablePokemon.heightAnchor.constraint(equalToConstant: 900)
        ])
        
        NSLayoutConstraint.activate([

            textError.centerXAnchor.constraint(equalTo: safeA.centerXAnchor),
            textError.widthAnchor.constraint(equalToConstant: 250)
            
        ])
        
    }
    
}


extension ViewController: ViewViewProtocol, UITableViewDataSource, UITableViewDelegate {
    func listPokemon(_ jsonData: [PokemonDetailInfoDTO?]) {
        pokemon = jsonData
    }
    
  
    
    func changeView(_ celda: CustomCell) {
        
        let vc = PokemonDetailInfoViewController()
        vc.pokemon = celda.pokemonInfo
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func presentErrorScreen() {
        self.view.backgroundColor = .red
        self.tablePokemon.isHidden = true
        self.textError.isHidden = false
        
    }
    
    func reloadTable() {
        if(pokemon.count >= 918){
            self.tablePokemon.reloadData()
        }
    }
    
    func buttonTouchedOnCell(celda: CustomCell) {
        self.changeView(celda)
    }
 
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return  pokemon.count
            
    }
       
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          let pokemonInfoDetail =  pokemon[indexPath.row]
    
          let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
          cell.titulo.text =  pokemonInfoDetail?.name
          cell.type.text = pokemonInfoDetail?.types[0]?.type?.name
          cell.btnDelegate = self
          cell.pokemonInfo = pokemonInfoDetail
          guard let img = pokemonInfoDetail?.sprites?.frontDefault else {return cell}
          cell.configureImage(with: img)
        
                  
          return cell
       
      }
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 100
       }
     
 
    
  
    
}
