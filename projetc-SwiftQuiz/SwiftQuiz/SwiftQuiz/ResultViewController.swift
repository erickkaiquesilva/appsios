//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Erick Kaique da Silva on 13/02/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    
    
    @IBOutlet weak var lbAnswered: UILabel!
    @IBOutlet weak var lbCorrect: UILabel!
    @IBOutlet weak var lbWrong: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    
    var totalCorrectAnswers: Int = 0
    var totalAnwers: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbAnswered.text = "Perguntas Respondidas \(totalAnwers)"
        lbCorrect.text = "Perguntas Respondidas \(totalCorrectAnswers)"
        lbWrong.text = "Perguntas Erradas: \(totalAnwers - totalCorrectAnswers)"
        
        let score = totalCorrectAnswers*100/totalAnwers
        lbScore.text = "\(score)%"
        
    }
    
    
    
    
    @IBAction func close(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    

}
