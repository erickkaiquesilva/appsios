// Funçoes : Function
/*
 func nomeDaFuncao(parametro : TipoDoParametro) -> TipoDeRetornoDaFuncao{
 
 Códigos/Estrucoes que sao exercidas dentro da funcao
 
 
 
 return TipoDeRetornoDaFuncao
 
 }
 */

func sayHello(){
    
    print("Hello, is my first Function")
    
}

sayHello()


func say(message : String){
    
    print(message)
}

say(message: "Olá... Good Morning")

func say2(message : String, to : String) -> String{
    
    return message + " " + to
}

let sentece = say2(message: "Hello, Good Morning", to: "Erick")
print(sentece)


func sum(a : Int, b : Int) -> Int{
    
    return a + b
    
}

let total = sum(a: 20, b: 20)

print(total)

func sum2(_ a: Int, _ b : Int) -> Int{
    return a + b
}

let total2 = sum2(20, 40)
print(total2)

// Funcoes que aceita uma colection de dados

func sum3(_ initialValue: Int, withValue values: Int...) -> Int{
    var result = initialValue
    
    for value in values{
        result += value
    }
    
    return result
}

print(sum3(3, withValue: 4,5,6,7,7,8,9,10))


// Retorna em mais de um tipo

import Foundation

let studentData = "Erick Kaique da Silva:39"

func getStudentInf(_ data: String) -> (name: String, age: Int){
    
    let info = data.components(separatedBy: ":")
    let studentName = info[0]
    let studentAge = Int(info[1])
    return (studentName, studentAge!)
    
}

let student = getStudentInf(studentData)
print(student.name)
print(student.age)

// OBS: First Class Citizen (???) -> é considerado um first class citizen, toda func que pode ser passada, possa ser modificada, possa ser alterada seu valor.


func sum(_ a: Int, _ b: Int) -> Int{
    return a + b
}

func subtract(_ a: Int, _ b: Int) -> Int{
    return a - b
}

func divide(_ a: Int, _ b: Int) -> Int{
    return a / b
}

func multplay(_ a: Int, _ b: Int) -> Int{
    return a * b
}

typealias Op = (Int, Int) -> Int

func applyOperation(_ a: Int, _ b: Int, operation:  Op) -> Int{
    
    return operation(a,b)
    
}

let result = applyOperation(10, 20, operation: multplay)


func getOperation(_ operation: String) -> Op{
    
    switch operation {
    case "soma":
        return sum
    case "sub"
        return subtract
    case "mult"
        
        
}
