//
//  PasswordViewController.swift
//  SuperSenha
//
//  Created by Erick Kaique da Silva on 19/02/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {

    @IBOutlet weak var listPasswordTableView: UITextView!
    
    var numberOfCharacters = 10
    var numberOfPassword = -1
    var userLatters: Bool!
    var userNumbers: Bool!
    var useCapitalLetters: Bool!
    var userSpecialCharacaters: Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "Total de senhas: \(numberOfPassword)"
        
        passwordGenerator = PasswordGenerator(numberOfCharaters: numberOfCharacters, useLetters: userLatters, useNumbers: userNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacters: userSpecialCharacaters)
        
        generatePasswords()
    }
    
    func generatePasswords(){
        listPasswordTableView.scrollRangeToVisible(NSRange(location: 0, length: 0))
        listPasswordTableView.text = ""
        
        let pass = passwordGenerator.generate(numberOfPassword)
        
        for passwords in pass{
            listPasswordTableView.text.append(passwords + "\n\n")
        }
        
        
    }
    
    @IBAction func generate(_ sender: UIButton) {
        generatePasswords()
        
    }
    

}
