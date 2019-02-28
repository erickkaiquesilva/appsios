import UIKit

// Array's

var names = ["Erick", "Kaique", "Lucas"]
var namesB = ["Giovanna", "Isadora", "Viória"]

// Para iniciar um array é necessário dizer seu tipo
var lotteryNumbers : [Int] = []
var phoneNumbers : [String]? // Array opcional

var ages : [UInt8] = [9, 29, 23, 19] // Este tipo de array aceita número inteiros, porem nao permite
                                    //números negativos de inteiros.


var guests = ["Julio", "Marcos", "Maria", "Ana"]

print(guests.count) // devolvendo a quantidade de itens dentro do array

print(guests.isEmpty) // me devolve um resultado boleano para dizer se esta vazio ou nao

// recuperando dados no array, pelo indice

let secondGuest = guests[1]
guests[0] = "Mario"
guests[0...1] = ["Barbara", "Luana", "Adriele"] //  Neste caso eu estou tirando os dois primeiros
                                                // Elementos do array e add outros no lugar

print(guests)

// buscando o primeiro e ultimo elemento de um array
// Eu uso o if let, pois pode ser que retorne ou nao. E para se previnir de fatal error, fazemos isso.
if let first = guests.first{
    print(first)
}

if let last = guests.last{
    print(last)
}

// Add novos elementos dentro do array

guests += ["Erick", "Kaique"]

guests.append("Clara") // Neste metodo estamos add somente um elemento.

guests.insert("Guilherme", at: 3) // aqui eu estou dizendo que quero colocar esse novo elemento.
// na position 3. OBS: vale lembrar que devemos indicar uma posicao que exista, pois caso indique
// uma posicao inezistente, o app crachea.

print(guests)

// removendo elements
/*
guests.remove(at: 3) //  aqui eu passo o elemento da posicao que quero remover
guests.removeFirst() // o primeiro elemento
guests.removeLast() // o ultimo elemento
guests.removeAll() // removendo todo o array
*/

// Descobrindo a ocorrencia de um elemento dentro do array
if guests.contains("Adriele"){
    print("Convidado encontrado")
}else{
    print("OPS nao existe nenhum convidado com este name")
}



/*
    USANDO DICTIONARY
*/

var states = [
    "SP" : "Sao Paulo",
    "RJ" : "Rio de Janeiro",
    "PR" : "Parana",
    "RS" : "Rio Grande do Sul",
    "BH" : "Bahia"
]

// definindo um dictionary vazio
var studentGrade : [String : Double ] = [:]

states["GO"] = "Goiaz"
// retirando um valor de dentro de um array, mas antes armazenando em uma variavel
let oldGo = states.updateValue("Goias", forKey: "GO")
print(oldGo)

let myState = states["SP"] // Passando o valor de uma chave para uma variavel

if let state = myState {
    print(state)
}

// eliminando um elemento de dentro de um dictionary
states["RJ"] = nil
print(states)

// Armazenando o elemento que irei remover e depois removendo
let rmBH = states.removeValue(forKey: "BH")
print(rmBH)

print(states.count) // sabendo quantos elementos tem cadastrado dentro do dictionary

// convertendo as Keys ou Values de um dictionary  em um array

let keys = Array(states.keys)
print(keys)

let values = Array(states.values)
print(values)

