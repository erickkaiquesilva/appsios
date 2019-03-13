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
   
    var refreshControl = UIRefreshControl()
    
    var fetchingMore = false
    
    var listRepo: [Repo] = []
    let requester: HttpRequester = HttpRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requester.request(endpoint: GithubEndpoint.repositories(1, 10), success: { (listRepo) in
        self.listRepo = listRepo.items
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        }) { (error) in
            print(error)
        }
//        request.resquestRepo(page: 1, per_page: 10, success: { (listRepo) in
//            self.listRepo = listRepo.items
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }) { (error) in
//            print(error)
//        }

        addRefreshControl()
    }

    
    func addRefreshControl(){
        
        refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.red
        refreshControl.addTarget(self, action: #selector(refreshList), for: .valueChanged)
        
        tableView.addSubview(refreshControl)
    }
    
    @objc func refreshList(){
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        //print("offset: \(offsetY) | contentHeight: \(contentHeight)")
        
        if offsetY > contentHeight - scrollView.frame.height{
            
            var countPage = 2
            var perPage = 100
            
            while perPage < 5000{
                if perPage <= 200{
                    requester.request(endpoint: GithubEndpoint.repositories(countPage, perPage), success: { (listRepo) in
                        self.listRepo += listRepo.items
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }) { (error) in
                        print(error)
                    }
                
//                    requester.request(ebd, success: { (listRepo) in
//                        self.listRepo += listRepo.items
//                        DispatchQueue.main.async {
//                            self.tableView.reloadData()
//                        }
//                    }) { (error) in
//                        print(error)
//                    }
                }
                countPage = countPage + 1
                perPage = perPage + 100
            }
            
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

