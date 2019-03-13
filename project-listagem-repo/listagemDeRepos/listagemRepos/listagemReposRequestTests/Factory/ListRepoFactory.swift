//
//  ListRepoFactory.swift
//  listagemReposRequestTests
//
//  Created by Erick Kaique da Silva on 12/03/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import Foundation
@testable import listagemRepos

struct ListRepoFactory {
    static func build()-> ListRepo {
        let user = User(login: "eita", avatar_url: "image")
        let repos = [Repo(full_name: "XPTO", stargazers_count: 4, owner: user),
                     Repo(full_name: "XPTO", stargazers_count: 4, owner: user),
                     Repo(full_name: "XPTO", stargazers_count: 4, owner: user)]
        
        return ListRepo(total_count: 3, items: repos)
    }
}
