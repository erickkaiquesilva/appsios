//
//  HttpRequest.swift
//  listagemRepos
//
//  Created by Erick Kaique da Silva on 19/02/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import Foundation
class HttpRequest {
    
    func resquestRepo(page: Int = 1, per_page: Int = 10, success: ((_ listRepo: ListRepo)-> Void)?, failure: ((_ error: Error)-> Void)?){
        
        guard let url = URL(string: "https://api.github.com/search/repositories?q=language:swift&sort=stars&per_page=\(per_page)&page=\(page)")else{ return }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        print(request)
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
