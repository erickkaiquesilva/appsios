// FOR IN


for day in 1...30 {
    print("Estou no \(day) de Janeiro")
}

var students = [
    "Ana Clara",
    "Luiz Carlos",
    "Giovana Vitória"
]

for student in students{
    print("O aluno \(student) veio na aula hoje")
}

let name = "Erick Kaique da Silva"

for letter in name{
    print(letter)
}

for (index, letter) in name.enumerated(){
    print(index, letter)
}

let people = [

    "Erick" : 23,
    "Lucas" : 19,
    "Giovanna" : 16
]

for person in people{
    print(person.key, person.value)
}


// WHILE

var life = 10

while life > 0{
    print("Continue Jogando")
    life = life - 1
}

import Foundation

var megaSena : [Int] = []

while megaSena.count < 6 {
    let number = Int(arc4random_uniform(60)+1)
    if !megaSena.contains(number){
        megaSena.append(number)
    }
}

print(megaSena.sorted())

var tries = 0
var diceNumber = 0

repeat{
    
    tries += 1
    diceNumber = Int(arc4random_uniform(6)+1)
    
}while diceNumber != 6

print("voce tirou 6 após \(tries) tentativas")


let grades = [10.0, 8.0, 8.5, 7.5, -1.0, 20.0]

for grade in grades{
    print(grade)
    if (grade < 0.0 || grade > 10.0){
        print("Nota inserida, é invalida")
        break
    }
}
