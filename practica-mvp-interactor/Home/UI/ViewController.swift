//
//  ViewController.swift
//  practica-mvp-interactor
//
//  Created by Agustin Chinchilla on 04/01/2022.
//

import UIKit

class ViewController: UIViewController{
   
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
        
        self.view.addSubview(tablePokemon)
        guard let viewPresenter = presenter else {return}
        
        self.tablePokemon.register(CustomCell.self, forCellReuseIdentifier: "Cell")
        self.tablePokemon.dataSource = viewPresenter
        self.tablePokemon.delegate = viewPresenter
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
        
    }


}

extension ViewController: ViewViewProtocol {
    func presentErrorScreen() {
        print("error")
    }
    
    func reloadTable() {
        self.tablePokemon.reloadData()
    }
    
}
