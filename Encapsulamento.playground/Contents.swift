//Encapsulamento

class CreditCard{
    
    let number: String
    let limit: Double
    private var invoiceValue: Double = 0
    
    let iof: Double = 6.38
    
    init(number: String, limit: Double) {
        self.number = number
        self.limit = limit
    }
    
    // A palavra reservada Final, permite que eu reutilize meu método nas classe filhas, porem nao modifique ele
    final func makePurchase(off value: Double, usingCreditCard: Bool) -> Bool {
        
        let debit = usingCreditCard ? value * (1 + iof/100) : value
        let finalValue = invoiceValue + debit
        
        if finalValue > limit{
            return false
        } else {
            invoiceValue = finalValue
            return true
        }
    }
    
    func getInvoice() -> Double{
        return invoiceValue
    }
    // Faz o mesma coisa que o código acima. somente é uma var computada
    var invoice: Double {
        return invoiceValue
    }
    

}

let creditCard = CreditCard(number: "1234-1232-2334-5454", limit: 5000)
creditCard.makePurchase(off: 1500, usingCreditCard: true)
print(creditCard.getInvoice())
print(creditCard.invoice)

class DebitCreditCard: CreditCard{
    private var _balance : Double = 0
    
    var balance: Double{
        return _balance
    }
    
    func makeTransection(of value: Double) {
        _balance += value
    }
    
    
    
}


let debitCard = DebitCreditCard(number: "3443-4355-5645-5665", limit: 7000)
debitCard.makeTransection(of: 700)

print(debitCard.balance)


