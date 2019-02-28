// HERANÇA

class Animal{
    
    let color: String
    let gender: Character
    let breed: String
    
    
    init(color: String, gender: Character, breed: String) {
        self.color = color
        self.gender = gender
        self.breed = breed
    }
    
    func emiteSound(){
        print("...")
    }
}
// Dogs herda de Animal
class Dogs: Animal{
    func run(){
        print("O cachorro está correndo")
    }
}

class Birds: Animal{
    
    let canFly: Bool
    
    func  fly(){
        if canFly{
            print("O pássaro está voando")
        }else{
            print("O pássaro nao voa")
        }
    }
    
    // Designated Initializer
    // Este construtor tem por obrigaçao passar informacoes para inicializar a classe
    init(color: String, gender: Character, breed: String, canFly: Bool) {
        self.canFly = canFly
        // Chamando o construtor da classe mae
        super.init(color: color, gender: gender, breed: breed)
    }
    
    // Convenience Initializer
    /*
        Aqui ja é um construtor que setamos as informaçoes que nao queremos definir
    */
    convenience init(color: String, breed: String) {
        self.init(color: color, gender: "M", breed: breed, canFly: true)
    }
}

let billy = Dogs(color: "Marron", gender: "M", breed: "Pastor Alemao")
let zeCarioca = Birds(color: "Verde", gender: "M", breed: "Papagaio", canFly: true)
let maleBird = Birds(color: "Preto", breed: "Sabia")

billy.emiteSound()
zeCarioca.emiteSound()

/*
 
    1) Um designeted Initializer deve sempre chamar um designeted da sua classe mae
    2) Um Convinience Initializer deve chamar outro initializer da mesma classe
    3) Um Convinience Initializer deve chamar no final outro designeted initializer
 */


