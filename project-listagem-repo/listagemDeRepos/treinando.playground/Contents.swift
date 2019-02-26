
import Foundation

class httpRequest{
    
    var teste  = "Teste"
    
    func testando(){
        
        let url = URL(string: "https://api.github.com/search/repositories?q=language:swift&sort=stars")!
        
        var resquest = URLRequest(url: url)
        
        resquest.httpMethod = "GET"
        
        let session = URLSession.shared.dataTask(with: resquest) { (data, response, error) in
            
            guard let data = data else{return}
            
            do{
                let users = try JSONDecoder().decode(GitHub.self, from: data)
                print(users)
            }catch{
                print("Error")
            }
        }
        
        session.resume()
        
    }
    
    
}

extension httpRequest{
    
    struct GitHub: Decodable {
        let items: [Repos]
    }
    
    struct Repos: Decodable {
        let full_name: String
        let stargazers_count: Int
        let owner: Users
    }
    
    struct Users: Decodable {
        let login: String
        let avatar_url: String
    }
    
    
    
}
