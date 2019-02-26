//
//  ViewController.swift
//  conversor
//
//  Created by Erick Kaique da Silva on 08/02/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfVlue: UITextField!
    @IBOutlet weak var lbUnit: UILabel!
    
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    
    @IBOutlet weak var lbResult1: UILabel!
    @IBOutlet weak var lbResult2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text! {
            case "Temperatura":
                lbUnit.text = "Peso"
                btUnit1.setTitle("Kilograma", for: .normal)
                btUnit2.setTitle("Libra", for: .normal)
            case "Peso":
                lbUnit.text = "Moeda"
                btUnit1.setTitle("Real", for: .normal)
                btUnit2.setTitle("Dolar", for: .normal)
            case "Moeda":
                lbUnit.text = "Distancia"
                btUnit1.setTitle("Metro", for: .normal)
                btUnit2.setTitle("Quilometro", for: .normal)
            default:
                lbUnit.text = "Temperatura"
                btUnit1.setTitle("Celsius", for: .normal)
                btUnit2.setTitle("Fahrenheit", for: .normal)
        }
        convert(nil)
    }
    
    
    @IBAction func convert(_ sender: UIButton?) {
        
        if let sender = sender {
            if sender == btUnit1 {
                btUnit2.alpha = 0.5
            }else{
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch lbUnit.text! {
            case "Temperatura":
                calcTemp()
            case "Peso":
                calcWeight()
            case "Moeda":
                calcCurrency()
            default:
                calcDistance()
        }
        
        view.endEditing(true)
        let result = Double(lbResult1.text!)!
        // Maneira de dizer que quero que o formato seja de 2 casas após a virgula.
        lbResult1.text = String(format: "%.2f", result)
    }
    
    func calcTemp(){
        
        //
        guard let temperature = Double(tfVlue.text!) else{return}
        
        if btUnit1.alpha == 1.0 {
            lbResult2.text = "Farenheint"
            lbResult1.text = String(temperature * 1.8 + 32.0)
        }else{
            lbResult2.text = "Celsius"
            lbResult1.text = String((temperature - 32.0) / 1.8)
        }
    }
    
    func calcWeight(){
        
        guard let weight = Double(tfVlue.text!) else{return}
        
        if btUnit1.alpha == 1.0 {
            lbResult2.text = "Libra"
            lbResult1.text = String(weight / 2.2046)
        } else {
            lbResult2.text = "Kilograma"
            lbResult1.text = String(weight * 2.2046)
        }
        
        
    }
    
    func calcCurrency(){
        
        guard let currency = Double(tfVlue.text!) else{return}
        
        if btUnit1.alpha == 1.0 {
            lbResult2.text = "Dólar"
            lbResult1.text = String(currency / 3.5)
        } else {
            lbResult2.text = "Real"
            lbResult1.text = String(currency * 3.5)
        }
    }
    
    func calcDistance(){
        
        guard let distance = Double(tfVlue.text!) else{return}
        
        if btUnit1.alpha == 1.0 {
            lbResult2.text = "Kilometro"
            lbResult1.text = String(distance / 1000.0)
        }else{
            lbResult2.text = "Metro"
            lbResult1.text = String(distance * 1000.0)
        }
        
    }
}

