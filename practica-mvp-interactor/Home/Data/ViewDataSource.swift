//
//  ViewDataSource.swift
//  practica-mvp-interactor
//
//  Created by Agustin Chinchilla on 04/01/2022.
//

import Foundation
import Alamofire

class ViewDataSource: ViewDataSourceProtocol{
    
    static let shared = ViewDataSource()
    
    let url = "https://pokeapi.co/api/v2/pokemon?limit=1180&offset=200"
    
    func GoToInfo<T: Decodable>(responseType: T.Type , method: HTTPMethod, completionHandler:@escaping(_ status:Bool , _ data : T?)->()) {
        Alamofire.Session.default.session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        var request = URLRequest(url: URL(string: "\(self.url)")!)
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
                            print(error.localizedDescription)
                        }
                        break
                    case .failure(let error):
                        print(error)
                        completionHandler(false, nil)
                        break
                    }
            }

        }
    
    func GoToImage<T: Decodable>(responseType: T.Type , method: HTTPMethod , endpoint: String , completionHandler:@escaping(_ status:Bool , _ data : T?)->()){
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
