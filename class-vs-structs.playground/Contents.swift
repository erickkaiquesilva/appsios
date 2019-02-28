// Class vs Structs

struct Student{
    
    var name : String
    var age : Int
}

class Person{
    
    var name : String
    var age : Int
    // Quando eu coloco weak, eu digo que a referencia é fraca desse cara.
    weak var friends : Person?
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    deinit {
        print("\(name) foi desalocado da memória")
    }
    
}


var student1 = Student(name: "Zeca", age: 22)
// Quando isso é feito, voce faz uma cópia da struct
var student2 = student1

student1.name = "Alisson"
student1.age = 33

print(student2.name, student2.age)

//================================================//

var person1: Person? = Person(name: "Zeca", age: 22)
var person2: Person? = Person(name: "Henrrique", age: 44)

print(person2!.name, person2!.age)

// Value Type = A passagem é por cópia/ Ocorre com struct

// Reference Type = a passagem é por referencia/ Ocorre com class

person1 = nil
person2 = nil



