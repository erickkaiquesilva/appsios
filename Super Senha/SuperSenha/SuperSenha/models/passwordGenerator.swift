//
//  passwordGenerator.swift
//  SuperSenha
//
//  Created by Erick Kaique da Silva on 19/02/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import Foundation

class PasswordGenerator{
    
    var numberOfCharaters: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacters: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters = "!@#$%ˆ&*()_-+=`|]}[{':;?/<>.,"
    private let numbers = "0123456789"
    
    init(numberOfCharaters: Int, useLetters: Bool, useNumbers: Bool, useCapitalLetters: Bool, useSpecialCharacters: Bool) {
        
        var numchars = min(numberOfCharaters, 16)
        numchars = max(numchars, 1)
        
        self.numberOfCharaters = numchars
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharacters = useSpecialCharacters
        
    }
    
    func generate(_ total: Int) -> [String]{
        
        passwords.removeAll()
        
        var universe: String = ""
        
        if useLetters{
            universe += letters
        }
        
        if useNumbers{
            universe += numbers
        }
        
        if useCapitalLetters{
            universe += letters.uppercased()
        }
        
        if useSpecialCharacters{
            universe += specialCharacters
        }
        
        let universeArray = Array(universe)
        
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfCharaters{
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            
            passwords.append(password)
        }
        
        return passwords
    }
    
}
