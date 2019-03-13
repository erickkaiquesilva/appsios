//
//  ViewController.swift
//  ComprasUSA
//
//  Created by Erick Kaique da Silva on 22/02/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController {

    @IBOutlet weak var dolarLabel: UITextField!
    @IBOutlet weak var realDescriptionLabel: UILabel!
    @IBOutlet weak var realLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAmmount()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dolarLabel.resignFirstResponder()
        setAmmount()
    }
    
    func setAmmount(){
        tc.shoppingValue = tc.convertToDouble(dolarLabel.text!)
        realLabel.text = tc.getFormattedValue(of: tc.shoppingValue * tc.dolar, withCurrency: "R$ ")
        let dolar = tc.getFormattedValue(of: tc.dolar, withCurrency: "")
        realDescriptionLabel.text = "Valor sem impostos (dólar \(dolar)"
    }

}

