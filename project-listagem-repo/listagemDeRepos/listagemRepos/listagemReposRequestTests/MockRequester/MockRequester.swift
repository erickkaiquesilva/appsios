//
//  MockRequester.swift
//  listagemReposRequestTests
//
//  Created by Erick Kaique da Silva on 12/03/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import Foundation
@testable import listagemRepos

struct MockRequester: HttpRequester {
    
    var isErrored = false
    
    func request(endpoint: Endpoint, success: ((ListRepo) -> Void)?, failure: ((Error) -> Void)?) {
        if isErrored {
            failure?(NSError(domain: "XPTO", code: 404, userInfo: nil))
            return
        }
        success?(ListRepoFactory.build())
    }
}

