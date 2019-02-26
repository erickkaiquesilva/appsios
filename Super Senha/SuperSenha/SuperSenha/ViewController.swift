//
//  ViewController.swift
//  SuperSenha
//
//  Created by Erick Kaique da Silva on 19/02/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalPasswordTextField: UITextField!
    @IBOutlet weak var NumberOfCharactersTextField: UITextField!
    @IBOutlet weak var lattersSwitch: UISwitch!
    @IBOutlet weak var numbersSwitch: UISwitch!
    @IBOutlet weak var capitalLettersSwitch: UISwitch!
    @IBOutlet weak var specialCharactersSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordViewController
        if let numberOfPasswords = Int(totalPasswordTextField.text!){
            passwordsViewController.numberOfPassword = numberOfPasswords
        }
        if let numberOfCharacters = Int(NumberOfCharactersTextField.text!){
            passwordsViewController.numberOfCharacters = numberOfCharacters
        }
        passwordsViewController.userLatters = lattersSwitch.isOn
        passwordsViewController.userNumbers = numbersSwitch.isOn
        passwordsViewController.useCapitalLetters = capitalLettersSwitch.isOn
        passwordsViewController.userSpecialCharacaters = specialCharactersSwitch.isOn
        view.endEditing(true)
    }


}

