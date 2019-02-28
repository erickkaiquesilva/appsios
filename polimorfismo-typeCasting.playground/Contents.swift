// Polimorfismo and Type Casting

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

class Dogs: Animal{
    
    override func emiteSound() {
        print("au au au...")
    }
    
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
    
    init(color: String, gender: Character, breed: String, canFly: Bool) {
        self.canFly = canFly
        super.init(color: color, gender: gender, breed: breed)
    }
    
    
    convenience init(color: String, breed: String) {
        self.init(color: color, gender: "M", breed: breed, canFly: true)
    }
    
    override func emiteSound() {
        print("🎶 🎶 🎶 🎶 🎶")
    }
    
    
}

class Duck: Birds{
    override func emiteSound() {
        print("Quack Quack Quack...")
    }
    
    init(color: String, gender: Character, breed: String) {
        super.init(color: color, gender: gender, breed: breed, canFly: true)
    }
    
}


let donald = Duck(color: "Branco", gender: "M", breed: "Disnay")

let billy = Dogs(color: "Marron", gender: "M", breed: "Pastor Alemao")
let zeCarioca = Birds(color: "Verde", gender: "M", breed: "Papagaio", canFly: true)
let maleBird = Birds(color: "Preto", breed: "Sabia")

billy.emiteSound()
zeCarioca.emiteSound()

print(donald.emiteSound())


// Type Casting

/*
    No caso deste array, ele tem a seguinte definiçao como Animal, entao caso eu queira utilizar um método da class dog ou birds.
    nao poderia porque seu type ja foi passado como Animal.
    Porem abaixo podemos aparecer com uma solution.
 */
let animals : [Animal] = [
    Animal(color: "Preto", gender: "F", breed: "Zurubeba"),
    Dogs(color: "Marron", gender: "M", breed: "Cocker Spaniel"),
    Duck(color: "Branco", gender: "M", breed: "Silvestre"),
    Birds(color: "Green", gender: "F", breed: "Avestruz", canFly: false)
]


print("==================================")
for animal in animals{
    animal.emiteSound()
    /*
        Basicamente aqui estamos dizendo que caso o tipo do animal seja do tipo Dogs tambem.
        utilize o metodo run em aniaml. Porem eu estou fazendo isso forçadamente, e pode me gerar riscos.
    */
    if animal is Dogs{
        (animal as! Dogs).run()
    }
    /*
        Uma outra forma de ultizar poderia ser com if let
    */
    
    if let bird = animal as? Birds{
        bird.fly()
    }
    
}













