import UIKit

var str = "Hello, playground"

var driverLicense : Int?

//driverLicense = 30030404

//print(driverLicense)

// Dessa maneira corre o risco de desnbrulha o valor de um opcional e crachea seu app
//print("Essa é a numeraçao da minha CNH:", driverLicense!)


// forma segura de desenbrulha um opcional -> ou mais conhecido como unwrap

if let cartDriver = driverLicense{
    print("Essa é a numeraçao da minha CNH:", cartDriver)
}else{
    print("OPS!!! Error")
}

