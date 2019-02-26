//
//  Quiz.swift
//  SwiftQuiz
//
//  Created by Erick Kaique da Silva on 13/02/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import Foundation



class Quiz {
    
    //Responsavel por representar uma pergunta
    
    let question: String
    let options: [String]
    private let correctedAnswer: String
    
    init(question: String, options: [String], correctedAnswer: String) {
        
        self.question = question
        self.options = options
        self.correctedAnswer = correctedAnswer
        
    }
    
    func validadeOption(_ index: Int) -> Bool{
        let answer = options[index]
        return answer == correctedAnswer
        
    }
    
    deinit {
        print("Liberou o Quiz da Memory")
    }
    
}
