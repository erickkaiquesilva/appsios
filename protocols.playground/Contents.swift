// Protocolos (Protocols)

enum FuelType{
    case gasoline, ethanol, diesel, flex
}

protocol ACCapable{
    //Quando criamos uma propriedade no protocol, é necessário definir, se ela é
    // de leitura, de atribuir. ou amabos os casos.
    var hasAC: Bool {get set}
    
    func turnAC(on: Bool)
}

class Vehicle{
    
    var brand: String
    var fuelType: FuelType
    
    init(brand: String, fuelType: FuelType) {
        self.brand = brand
        self.fuelType = fuelType
    }
    
}

class Car: Vehicle, ACCapable{
    
    var numberOfDoors: Int
    
    var hasAC: Bool = true
    
    init(brand: String, fuelType: FuelType, numberOfDoors: Int) {
        self.numberOfDoors = numberOfDoors
        super.init(brand: brand, fuelType: fuelType)
    }
    
    func turnAC(on: Bool) {
        if on{
            print("Ligando ar-condicionado")
        }else{
            print("Desligando ar-condicionado")
        }
    }
    
}

class Bike: Vehicle{
    
    var cc: Int
    
    init(brand: String, fuelType: FuelType, cc: Int) {
        self.cc = cc
        super.init(brand: brand, fuelType: fuelType)
    }
    
}

class Airplane: Vehicle, ACCapable{
    
    var numberOfEngines: Int
    
    var hasAC: Bool = true
    
    func turnAC(on: Bool) {
        
        if numberOfEngines > 1{
            print("Avioes monomotores nao pode ligar o ar-condicionado")
        }else{
            if on{
                print("Ligando ar-condicionado")
            }else{
                print("Desligando ar-condicionado")
            }
        }
    }
    
    init(brand: String, fuelType: FuelType, numberOfEngines: Int) {
        self.numberOfEngines = numberOfEngines
        super.init(brand: brand, fuelType: fuelType)
    }
    
}
