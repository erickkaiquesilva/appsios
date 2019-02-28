//
//  HttpRequest.swift
//  listagemRepos
//
//  Created by Erick Kaique da Silva on 19/02/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import Foundation
class HttpRequest {
    
<<<<<<< HEAD
    func resquestRepo(page: Int = 1, per_page: Int = 10, success: ((_ listRepo: ListRepo)-> Void)?, failure: ((_ error: Error)-> Void)?){
        
        guard let url = URL(string: "https://api.github.com/search/repositories?q=language:swift&sort=stars&per_page=\(per_page)&page=\(page)")else{ return }
=======
    func resquestRepo(success: ((_ listRepo: ListRepo)-> Void)?, failure: ((_ error: Error)-> Void)?){
        
        guard let url = URL(string: "https://api.github.com/search/repositories?q=language:swift&sort=stars")else{ return }
>>>>>>> 08af8f025ae0ee07dde7b858e93f28346ace1570
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
<<<<<<< HEAD
        print(request)
=======
        
>>>>>>> 08af8f025ae0ee07dde7b858e93f28346ace1570
        let session = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else{return}
            
            do{
                let users = try JSONDecoder().decode(ListRepo.self, from: data)
                print(users)
                success?(users)
                
                
                
            }catch{
                print(error)
                failure?(error)
            }
        }
        
        return session.resume();
    }
}
