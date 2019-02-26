//
//  ColorPickerViewController.swift
//  Mensagens
//
//  Created by Erick Kaique da Silva on 20/02/2019.
//  Copyright © 2019 Eric Brito. All rights reserved.
//

import UIKit

protocol  colorPickerDelegate: class  {
    func  applayColor(color: UIColor)
}

class ColorPickerViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    weak var delegate: colorPickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func chooseColor(_ sender: UIButton) {
        delegate?.applayColor(color: colorView.backgroundColor!)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeColor(_ sender: UISlider) {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
    }
}
