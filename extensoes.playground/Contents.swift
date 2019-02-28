//Extensoes or Extensions

import Foundation

let name = "Erick Kaique da Silva"

extension String {
    
    var vowels: [Character]{
        
        var list: [Character] = []
        
        for character in characters{
            
            switch String(character) {
            case "a", "e", "i", "o", "u":
                list.append(character)
            default:
                break
            }
        }
        return list
    }
    
    func initials() -> String{
        let array = self.components(separatedBy: " ")
        let firsts = array.map({$0.first!})
        
        return String(firsts)
    }
    
}

print(name.vowels)

print(name.initials())


class Account{
    
    let number: String
    var balance: Double = 0
    
    init(number: String) {
        self.number = number
    }
}

extension Account{
    convenience init(number: String, balance: Double){
        self.init(number: number)
        self.balance = balance
    }
    
    func getBalance() -> Double{
        return balance
    }
}

let account = Account(number: "3030030020", balance: 34000)

account.getBalance()
