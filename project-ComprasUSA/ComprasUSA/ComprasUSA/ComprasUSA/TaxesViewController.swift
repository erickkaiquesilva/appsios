//
//  TaxesViewController.swift
//  ComprasUSA
//
//  Created by Erick Kaique da Silva on 22/02/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit

class TaxesViewController: UIViewController {

    @IBOutlet weak var totalDolar: UILabel!
    @IBOutlet weak var descriptionTaxStateLabel: UILabel!
    @IBOutlet weak var taxStateLabel: UILabel!
    @IBOutlet weak var descriptionIOFLabel: UILabel!
    @IBOutlet weak var iofLabel: UILabel!
    @IBOutlet weak var creditCardSwitch: UISwitch!
    @IBOutlet weak var totalRealLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateTaxes()
        
    }
    @IBAction func changeIOF(_ sender: Any) {
        calculateTaxes()
    }
    
    func calculateTaxes(){
        descriptionTaxStateLabel.text = "Imposto do Estado (\(tc.getFormattedValue(of: tc.taxState, withCurrency: ""))%)"
        descriptionIOFLabel.text = "IOF (\(tc.getFormattedValue(of: tc.iof, withCurrency: ""))%)"
        
        totalDolar.text = tc.getFormattedValue(of: tc.shoppingValue, withCurrency: "UU$ ")
        taxStateLabel.text = tc.getFormattedValue(of: tc.stateTaxValue, withCurrency: "UU$ ")
        iofLabel.text = tc.getFormattedValue(of: tc.iofValue, withCurrency: "UU$ ")
        
        let real = tc.calculate(usingCreditCard: creditCardSwitch.isOn)
        totalRealLabel.text = tc.getFormattedValue(of: real, withCurrency: "R$ ")
    }
    
    
}
