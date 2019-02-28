var movies : Set<String> = [
    "Matrix",
    "Vingadores",
    "Jurassic Park",
    "De Volta para o Futuro"
]

var movies2 = Set<String>()

movies.insert("Homem-Aranha: De Volta para o Lar")
print(movies.count)


let result = movies.insert("Matrix")
// Neste caso, eu estou devolvendo se o valor que eu tentei inserir foi inserido, e tambem qual o valor que tentei inserir
print(result.inserted, result.memberAfterInsert)

movies.remove("Homem-Aranha: De Volta para o Lar")
print(movies)


// Imprimindo cada filme
for movie in movies {
    print(movie)
}

if movies.contains("Matrix"){
    print("Elemento esta dentro do SET")
}


var myWifeMovies : Set<String> = [

    "De Repente 30",
    "Simplesmente Acontece",
    "De Volta para o Futuro",
    "Jurassic Park"
]

// Criando uma lista de favorites movies, com relacao ao que tem na minha lista e ao que tem na outra lista

let favoriteMovies = movies.intersection(myWifeMovies)

print(favoriteMovies)

// unindo as duas listas
let allMovies = movies.union(myWifeMovies)
print(allMovies)

// Quando eu faço isso, eu retiro todos os elementos da lista que eu subtrair a minha primeira lista, mais os itens que tinha de igual.
movies = movies.subtracting(myWifeMovies)
print(movies)



/*
 
    TRABALHANDO COM TUPLA
 
 */


//let address = "Av. Paulista, 1578, Sao Paulo - SP, 01310-200"


// criando uma tupla
/*
    Em uma tupla eu posso dizer seu tipo explicitamente, ou eu posso deixa implicito
*/
let address = ("Av", "Paulista", 1578, "Sao Paulo", "SP", "01310-200")
let address2: (type: String, name: String, number: Int, city: String, state: String, zipCode: String) = ("Av", "Paulista", 3020, "Sao Paulo", "SP", "02320-210")

print(address.2)
print(address2.name)


// posso dividir os valores da minha tupla em diversas variaveis
// neste caso abaixo eu passo os valores contidos dentro de address2 para as seguintes let's, depois as informaçoes que eu nao quero recuperar eu infiro
// um underline para abstrair
let (type, name, _, _, _, _) = address2

print(type)
print(name)

