//
//  listRepos.swift
//  listRepo
//
//  Created by Erick Kaique da Silva on 15/02/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import Foundation

struct ListRepo: Decodable {
<<<<<<< HEAD
    let total_count: Int
=======
>>>>>>> 08af8f025ae0ee07dde7b858e93f28346ace1570
    let items: [Repo]
}
//
struct Repo: Decodable {
    let full_name: String
    let stargazers_count: Int
    let owner: User
}
//
struct User: Decodable {
    let login: String
    let avatar_url: String
}
