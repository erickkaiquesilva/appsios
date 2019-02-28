//
//  MessageColorViewController.swift
//  Mensagens
//
//  Copyright © 2017 Eric Brito. All rights reserved.
//

import UIKit

class MessageColorViewController: BaseViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ScreenColorViewController
        vc.message = message
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = message.text
        messageLabel.textColor = message.textColor
    }
    
}

extension MessageColorViewController: colorPickerDelegate{
    
    func applayColor(color: UIColor) {
        messageLabel.backgroundColor = color
        message.backgroundColor = color
    }
}
