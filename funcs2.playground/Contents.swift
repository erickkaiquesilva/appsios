func somar(_ a: Int, _ b: Int) -> Int{
    return a + b
}

func subtract(_ a: Int, _ b: Int) -> Int{
    return a - b
}

func multplay(_ a: Int, _ b: Int) -> Int{
    return a * b
}

func divide(_ a: Int, _ b: Int) -> Int{
    return a / b
}

typealias Op = (Int, Int) -> Int

func applyOperation(_ a: Int, _ b: Int, operation: Op) -> Int{
    return operation(a,b)
}


func getOperation(_ operation: String) -> Op{
    
    switch operation {
        case "soma":
            return somar
        case "subtracao":
            return subtract
        case "multiplicacao":
            return multplay
        default:
            return divide
    }
}


let operation = getOperation("multiplicacao")

operation(20,30)
