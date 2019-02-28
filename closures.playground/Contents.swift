// Closures

func soma(_ a: Int, _ b: Int) -> Int{
    return a + b
}

func subtract(_ a: Int, _ b: Int) -> Int {
    return a - b
}

func calculate(_ a: Int, _ b: Int, operation:(Int, Int) -> Int) -> Int{
    
    return operation(a, b)

}

calculate(20, 40, operation: soma)

let result = calculate(2, 30, operation: {(a: Int, b: Int) -> Int in
    return a * b
})

print(result)

calculate(3, 29, operation: *)

// MAP

import Foundation

var names = [
    
    "   Erick  ",
    "Lucas    ",
    "   Giovannna",
    "  Isadora     "
    
]
let corretorName = names.map({$0.trimmingCharacters(in: CharacterSet.whitespaces)})

print(corretorName)

let uppercasedName = corretorName.map({$0.uppercased()})

print(uppercasedName)


let silvas = corretorName.map({$0 + " Silva"})

print(silvas)

let newName = corretorName.filter({$0.count < 7})
print(newName)

let sumLetters = corretorName.reduce(0, {$0 + $1.count})
print(sumLetters)
