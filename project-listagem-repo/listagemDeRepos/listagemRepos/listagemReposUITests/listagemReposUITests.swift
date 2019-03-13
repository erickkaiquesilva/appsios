//
//  listagemReposUITests.swift
//  listagemReposUITests
//
//  Created by Erick Kaique da Silva on 12/03/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import XCTest
@testable import listagemRepos

class listagemReposUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        
        app = XCUIApplication ()
        app.launch()
    }

    override func tearDown() {
        
    }

    func testUIRepo() {
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
