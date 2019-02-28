import Foundation
// Operadores Personalizados

//Unário -> Operam somente em 1 operando
//prefix
//postfix

//Binário -> Operam em 2 operando
//infix

//PREFIX -> opera do lado direito do seu operando

prefix operator <|
prefix func <| (right: [Int]) -> [Int]{
    
    let result = right.map({$0 - 1})
    
    
    return result
}

let ages = [
    
    20,
    30,
    12,
    18,
    23
]
let lastYearAges = <|ages

// POSTFIX -> opera do lado esquerdo do seu operando

postfix operator <<<
postfix func <<< (left: Int) -> Int{
    
    var result = 1
    
    if left < 2 {
        return result
    }
    
    for i in 2...left{
        result *= i
    }
    return result
}


10<<<
5<<<
4<<<

infix operator ---
func ---(left: Int, right: Int) -> [Int]{
    return Array(right...left).reversed()
}

30---12

/*
    Com este operador eu estou criando uma dinamica de criar 6 números aleatórios de 1 a 60 e poder mostrar de forma ordenada
 */
infix operator >-<
func >-< (total: Int, universe: Int) -> [Int]{
    var result: [Int] = []
    
    while result.count < total{
        let randomNumber = Int(arc4random_uniform(UInt32(universe))+1)
        if !result.contains(randomNumber){
            result.append(randomNumber)
        }
    }
    return result.sorted()
}

print(6>-<60)

