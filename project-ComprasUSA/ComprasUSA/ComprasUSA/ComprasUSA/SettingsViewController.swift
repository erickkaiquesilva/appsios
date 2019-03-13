//
//  SettingsViewController.swift
//  ComprasUSA
//
//  Created by Erick Kaique da Silva on 22/02/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var dolarTextField: UITextField!
    @IBOutlet weak var iofTextField: UITextField!
    @IBOutlet weak var taxStateTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dolarTextField.text = tc.getFormattedValue(of: tc.dolar, withCurrency: "")
        iofTextField.text = tc.getFormattedValue(of: tc.iof, withCurrency: "")
        taxStateTextField.text = tc.getFormattedValue(of: tc.taxState, withCurrency: "")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func setValues() {
        tc.dolar = tc.convertToDouble(dolarTextField.text!)
        tc.iof = tc.convertToDouble(iofTextField.text!)
        tc.taxState = tc.convertToDouble(taxStateTextField.text!)
    }
}

extension SettingsViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        setValues()
    }
}
