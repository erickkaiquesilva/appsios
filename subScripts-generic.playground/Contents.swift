// Subscripts Generics

class Car{
    
    var licensePlate: String
    
    subscript(index: Int) -> String{
        
        get{
            let character = Array(licensePlate)[index]
            return String(character)
        }
        
        set{
            var array = Array(licensePlate)
            array[index] = Character(newValue)
            self.licensePlate = String(array)
        }
        
    }
    
    init(licensePlate : String){
        
        self.licensePlate = licensePlate
        
    }
    
}


let car1 = Car(licensePlate: "UFK-2399")

car1[5]

car1[1] = "E"
print(car1.licensePlate)

//Generics

// Estou criando um tipo genério chamado T
func swapValues<T>(_ a: inout T, _ b: inout T){
    
    let tempA = a
    a = b
    b = tempA
}

var number1 = "a"
var number2 = "v"

//swapInts(&number1, &number2)
swapValues(&number1, &number2)

number1

number2








