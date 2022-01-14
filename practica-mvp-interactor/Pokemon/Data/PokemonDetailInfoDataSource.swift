//
//  PokemonDetailInfoDataSource.swift
//  practica-mvp-interactor
//
//  Created by Agustin Chinchilla on 12/01/2022.
//

import Foundation
import Alamofire


class PokemonDetailInfoDataSource : PokemonDetailInfoDataSourceProtocol {
    func GoToInfo<T: Decodable>(responseType: T.Type , method: HTTPMethod , endpoint: String , completionHandler:@escaping(_ status:Bool , _ data : T?)->()){
        Alamofire.Session.default.session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        var request = URLRequest(url: URL(string: "\(endpoint)")!)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        
        AF.request(request)
            .validate(statusCode: 200..<300)
            .responseData { response in
        
                    switch response.result {
                    case .success(let value):
                        do{
                            let data = try JSONDecoder().decode(T.self, from: value)
                            completionHandler(true, data)
                        }catch{
                            print(error)
                        }
                        break
                    case .failure(let error):
                        print(error)
                        completionHandler(false, nil)
                        break
                    }
            }
    }
    
    
}
