//
//  BaseViewController.swift
//  Mensagens
//
//  Created by Erick Kaique da Silva on 20/02/2019.
//  Copyright © 2019 Eric Brito. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    var message: Message!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeColor(_ sender: UIButton){
        
        if let reference = self as? colorPickerDelegate{
            let colorPicker = storyboard?.instantiateViewController(withIdentifier: "ColorPickerViewController") as! ColorPickerViewController
            colorPicker.modalPresentationStyle = .overCurrentContext
            colorPicker.delegate = reference
            present(colorPicker, animated: true, completion: nil)
        }
    }
}
