//
//  QuotesViewController.swift
//  Pensamentos
//
//  Created by Erick Kaique da Silva on 08/03/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit

class QuotesViewController: UIViewController {

    @IBOutlet weak var uiviewPhoto: UIImageView!
    @IBOutlet weak var uiviewWallpaper: UIImageView!
    @IBOutlet weak var labelQuote: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var ctTop: NSLayoutConstraint!
    
    let quotesManager = QuotesManager()
    var timer: Timer?
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareQuote()
    }
    
    func prepareQuote(){
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 8.0, repeats: true) { (timer) in
            self.showRandomQuote()
        }
        showRandomQuote()
    }
    
    func showRandomQuote(){
        let quote = quotesManager.getRandomQuote()
        labelQuote.text = quote.quote
        labelAuthor.text = quote.author
        uiviewPhoto.image = UIImage(named: quote.image)
        uiviewWallpaper.image = uiviewPhoto.image
        
        labelQuote.alpha = 0.0
        labelAuthor.alpha = 0.0
        uiviewPhoto.alpha = 0.0
        uiviewWallpaper.alpha = 0.0
        ctTop.constant = 50
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 2.5) {
            self.labelQuote.alpha = 1.0
            self.labelAuthor.alpha = 1.0
            self.uiviewPhoto.alpha = 1.0
            self.uiviewWallpaper.alpha = 0.25
            self.ctTop.constant = 10
            self.view.layoutIfNeeded()
        }
    }

}


