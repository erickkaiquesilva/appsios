//
//  listagemReposRequestTests.swift
//  listagemReposRequestTests
//
//  Created by Erick Kaique da Silva on 12/03/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import XCTest
@testable import listagemRepos

class listagemReposRequestTests: XCTestCase {
    
    var sessionUrl: URLSession!
    var requester: HttpRequester!
    
    override func setUp() {
        super .setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sessionUrl = URLSession (configuration: URLSessionConfiguration .default)
        requester = MockRequester()
    }

    override func tearDown() {
        super .tearDown()
        sessionUrl = nil
    
    }
    // Teste de Sucesso
    func testRequesterSuccess() {
        let promise = expectation(description: "requestSuccess")
        
        requester.request(endpoint: GithubEndpoint.repositories(0, 0), success: { (listRepo) in
            XCTAssertEqual(listRepo.items.count, 3)
            promise.fulfill()
        }, failure: nil)
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    // Teste de falha
    func testRequesterFailure() {
        let promise = expectation(description: "requestfail")
        requester = MockRequester(isErrored: true)
        
        requester.request(endpoint: GithubEndpoint.repositories(0, 0), success: nil, failure: { (error) in
            XCTAssertNotNil(error)
            promise.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    // Teste na chamada de serviço
    func testStatusCode200() {
        
        let url = URL(string: "https://api.github.com/search/repositories?q=language:swift&sort=stars&per_page=10&page=2")
        
        let promise = expectation(description: "Status code: 200")
        
        let dataTask = sessionUrl.dataTask(with: url!) {data, response, error in
            
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            }else if let statusCode = (response as? HTTPURLResponse)?.statusCode{
                if statusCode == 200{
                    promise.fulfill()
                }else{
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testCallToRepo() {
        
        let url = URL(string: "https://api.github.com/search/repositories?q=language:swift&sort=stars&per_page=450&page=2")
        
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        let dataTask = sessionUrl.dataTask(with: url!) {data, response, error in
            
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
        
            promise.fulfill()
        }
        dataTask.resume()
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
        
        self.measure {
            self.sessionUrl
        }
    }

}
