// Classes

class Person {
    
    var name : String
    var age : Int = 0
    var gender : Character
    
    // Método construtor
    
    init(name: String, gender: Character) {
        self.name = name
        self.gender = gender
    }
    
    func speak(sentence: String){
        if age < 3{
            print("gugu dada")
        }else{
            print(sentence)
        }
    }
    
    func introduce(){
        speak(sentence: "Olá meu nome é \(name)")
    }

}

class Job{
    
    
    var title: String
    var sallary: Double
    
    init(title: String, sallary: Double) {
        self.title = title
        self.sallary = sallary
    }
    
}

let joao = Person(name: "Joao", gender: "M")
let clara = Person(name: "Clara", gender: "F")
let fabio = Person(name: "Fábio", gender: "M")

joao.age = 25
clara.age = 20
fabio.age = 3

joao.introduce()
clara.introduce()
fabio.introduce()

class Vehicle {
    
    var speed: Double = 0 {
        // Observadores de propriedades
        // Toda vez que acessar esta var, este código entra em execuçao
        didSet {
            // Aqui estamos limitando o valor da var, entao speed sempre ira ter o valor, minimo entre a speed e o maxSpeed
            speed = min(speed, maxSpeed)
        }
    }
    var model: String
    
    static let speedUnit = "Km/h"
    
    var maxSpeed: Double{
        return 250
    }
    
    var speedInMilesPerHour: Double{
        get{
            // Digo qual a lógica que devo fazer para obter um valor da várivael
            
            return speed / 1.60934
        }
        set{
            // Digo o que devo fazer para definir um valor para a várivael
            
            speed = newValue * 1.60934
        }
    }
    
    init(model: String) {
        self.model = model
    }
    // Método de instacia
    func descript() -> String{
        
        return "Veículo: \(model), velocidade atual: \(speed)"
        
    }
    
    
    // Método de classe
    
    class func alert() -> String {
        return ("Se beber nao dirija")
    }
}

let car = Vehicle(model: "civic")

car.speed = 270




