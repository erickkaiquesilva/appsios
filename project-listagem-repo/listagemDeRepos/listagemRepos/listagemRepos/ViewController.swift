//
//  ViewController.swift
//  listagemRepos
//
//  Created by Erick Kaique da Silva on 18/02/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var listRepo: [Repo] = []
    let request = HttpRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        request.resquestRepo(success: { (listRepo) in
            self.listRepo = listRepo.items
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }) { (error) in
            print(error)
        }
    }


}



extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listRepo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell") as! UsersTableViewCell
        let item = self.listRepo[row]
        
        cell.nameUser?.text = item.full_name
        cell.loginUser.text = item.owner.login
        cell.imageUser.setImage(from: item.owner.avatar_url)
        cell.countStarsRepo?.text = String(item.stargazers_count)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
