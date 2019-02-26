//
//  UsersTableViewCell.swift
//  listagemRepos
//
//  Created by Erick Kaique da Silva on 19/02/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var loginUser: UILabel!
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var starsRepo: UIButton!
    @IBOutlet weak var countStarsRepo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
