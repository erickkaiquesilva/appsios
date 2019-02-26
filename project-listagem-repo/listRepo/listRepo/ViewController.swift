//
//  ViewController.swift
//  listRepo
//
//  Created by Erick Kaique da Silva on 15/02/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var full_last_name: UILabel!
    @IBOutlet weak var login: UILabel!
    @IBOutlet weak var avatar_user: UIImageView!
    @IBOutlet var starts_repo: [UIButton]!
    
    // Chamada do model
    let resquestRepos = httpRepos()
    
    // Método é executado no momento que a view carrega.
    override func viewDidLoad() {
        super.viewDidLoad()
        resquestRepos.ResquestRepo()
    }
    


}

extension ViewController: UITableViewController, UITableViewDataSource{
    
    
    
}

