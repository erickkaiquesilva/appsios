// Estruturas : Struct

let age : Int = 23

let name : String = "Erick"

struct Person {
    
    var name : String
    var age : Int = 0
    
    init(name : String) {
        self.name = name
    }
    
    func sayHello(){
        print("Olá voce")
    }
    
    // Toda vez que eu for alterar um elemento de dentro da struct é necessario eu colocar a palavra reservada MUTATING a frente do método que faz
    // a alteraçao.
    mutating func incrementAge(){
        age += 1
    }
}

var person = Person(name: "Erick Silva")

print(person)

print(person.sayHello())

var newPerson = Person(name: "Luiza")

newPerson.age = 22
newPerson.incrementAge()


// Computed Properties (Propriedades computadas)

struct Temperature {
    var celsius : Double
    var fahrenheit : Double{
        return celsius * 1.8 + 32
    }
}

var temperature = Temperature(celsius: 23)
print(temperature.celsius)
print(temperature.fahrenheit)
