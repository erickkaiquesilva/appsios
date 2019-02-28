//Enumeradores : (Enum)

enum CompassPoint {
    
    case north
    case east
    case west
    case south
}

var direction = CompassPoint.north

var direction2 : CompassPoint = .north

direction = .south


enum SeatPosition : String {
    case aisle = "corredor", middle = "meio", window = "janela"
}

var passengerSeat = SeatPosition.middle

switch passengerSeat {
case .aisle:
    print("O passageiro esta sentado no corredor")
case .middle:
    print("O passageiro esta sentado no meio")
case .window:
    print("O passageiro esta sentado na janela")
}

print(passengerSeat.rawValue)
// Automaticamente ao definir january como 1 ele ja redefinil os demais.
enum Month : Int{
    case january = 1
    case february
    case march
    case april
    case may
    case june
    case july
    case agust
    case september
    case october
    case november
    case december
}

print(Month.agust.rawValue)

// Valores associados (Associated Values)

enum Measure {
    case weight(Double)
    case age(Int)
    case size(width: Double, height: Double)
}

let measure : Measure = .size(width: 0.47, height: 1.87)

switch measure {
case .weight(let weight):
    print("O seu peso é \(weight)")
case .age(let age):
    print("A sua idade é \(age)")
case .size(let size):
    print("As suas medidas sao \(size.width) de largura e \(size.height) de altura")
}
