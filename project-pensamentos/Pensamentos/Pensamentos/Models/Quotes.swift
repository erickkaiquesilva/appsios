//
//  Quotes.swift
//  Pensamentos
//
//  Created by Erick Kaique da Silva on 08/03/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import Foundation


struct Quote: Codable{
    
    let quote: String
    let author: String
    let image: String
    
    
    var quoteFormatted: String{
        return "‟" + quote + "”"
    }
    
    var authorFormatted: String{
        return "- " + author + " -"
    }
    
}
