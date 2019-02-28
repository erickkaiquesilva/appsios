// Tratamento de Erro

enum LoginError : Error{
    case wrongLogin
    case wrongPassword
    case noInternetConnection
}

func login(_ username: String, _ password: String) throws -> Bool{
    
    if checkInternetConnection(){
        if username != "erick"{
            throw LoginError.wrongLogin
        }
        
        if password != "12345"{
            throw LoginError.wrongPassword
        }
        
        return true
    }else{
        throw LoginError.noInternetConnection
    }
    
}

func checkInternetConnection() -> Bool{
    return true
}

do{
    let loginResult = try login("erick", "12345")
} catch LoginError.wrongLogin{
    print("erro de usuário")
} catch LoginError.wrongPassword{
    print("erro de senha")
} catch LoginError.noInternetConnection{
    ("OPS!! Nao possui conexao com a internet...")
}
