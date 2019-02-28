//
//  ViewController.swift
//  MyTableView
//
//  Created by Erick Kaique da Silva on 14/02/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var array = [
        "Erick",
        "Lucas",
        "Giovanna"
    ]
    
    func teste (){
        let nome = URL(string: "https://api.github.com/search/repositories?q=language:swift&sort=stars")!
        
        var resquest = URLRequest(url: nome)
        
        resquest.httpMethod = "GET"
        
        let session = URLSession.shared.dataTask(with: resquest) { (data, response, error) in
            
            guard let data = data else{return}
            
            do{
                let users = try JSONDecoder().decode(GitHub.self, from: data)
                print(users)
            }catch{
                
            }
        }
        
        session.resume()
        
    }
    
    
    var users = ()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teste()
    }
}

struct GitHub: Decodable {
    let items: [Repo]
}

struct Repo: Decodable{
    let full_name: String
    let stargazers_count: Int
    let owner: User
}

struct User: Decodable {
    let login: String
    let avatar_url: String
}





extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = array[indexPath.row]
        
        return cell
        
    }
    
    
}
