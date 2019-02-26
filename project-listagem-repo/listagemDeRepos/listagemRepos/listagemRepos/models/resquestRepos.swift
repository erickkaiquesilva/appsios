//
//  listRepo.swift
//  listRepo
//
//  Created by Erick Kaique da Silva on 15/02/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import Foundation

class httpRepos {
    
    var lista: [String: Int] = [:]
    
    
    
    // Func que chama a URL
    func ResquestRepo(){
        
        guard let url = URL(string: "https://api.github.com/search/repositories?q=language:swift&sort=stars")else{ return }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        let session = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else{return}
            
            do{
                let users = try JSONDecoder().decode(ListRepo.self, from: data)
                print(users)
                
            }catch{
                print(error)
            }
        }
        
       
        
        return session.resume();
    }
    
    
    
    
}
//
struct ListRepo: Decodable {
    let items: [Repo]
}
//
struct Repo: Decodable {
    let full_name: String
    let stargazers_url: String
    let owner: User
}
//
struct User: Decodable {
    let login: String
    let avatar_url: String
}
