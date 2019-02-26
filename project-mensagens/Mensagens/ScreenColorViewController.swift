//
//  ScreenColorViewController.swift
//  Mensagens
//
//  Copyright © 2017 Eric Brito. All rights reserved.
//

import UIKit

class ScreenColorViewController: BaseViewController {
    
    @IBOutlet weak var viBorder: UIView!
    @IBOutlet weak var borderSwith: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = message.text
        messageLabel.textColor = message.textColor
        messageLabel.backgroundColor = message.backgroundColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func changeBorder(_ sender: UISwitch) {
        borderSwith.backgroundColor = sender.isOn ? .white : .clear
        /*
        if sender.isOn == true{
            viBorder.backgroundColor = .white
            print(sender.isOn)
        }else{
            viBorder.backgroundColor = .clear
            print(sender.isOn)
        }
        */
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ResultViewController
        vc.message = message
        vc.useWhiteBorder = borderSwith.isOn
        
        print(vc.message)
    }
    
    
}

extension ScreenColorViewController: colorPickerDelegate{
    func applayColor(color: UIColor) {
        view.backgroundColor = color
        message.screenColor = color
    }
}
