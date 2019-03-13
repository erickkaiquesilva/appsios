//
//  SettingsViewController.swift
//  Pensamentos
//
//  Created by Erick Kaique da Silva on 08/03/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var swithAutoRefresh: UISwitch!
    @IBOutlet weak var sliderTimerInterval: UISlider!
    @IBOutlet weak var seguimentScheme: UISegmentedControl!
    @IBOutlet weak var labelTimerInterval: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
    }
    
    @IBAction func changeColorSkin(_ sender: UISegmentedControl) {
    }
    
    
}
