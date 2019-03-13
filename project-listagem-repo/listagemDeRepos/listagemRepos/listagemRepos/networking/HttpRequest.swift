//
//  HttpRequest.swift
//  listagemRepos
//
//  Created by Erick Kaique da Silva on 19/02/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import Foundation

protocol HttpRequester {
    func request(endpoint: Endpoint, success: ((_ listRepo: ListRepo)-> Void)?, failure: ((_ error: Error)-> Void)? )
}

class HttpRequest: HttpRequester {
    
    func request(endpoint: Endpoint, success: ((_ listRepo: ListRepo)-> Void)?, failure: ((_ error: Error)-> Void)?) {
        var request = URLRequest(url: endpoint.url)
        request.httpMethod = endpoint.method.rawValue
        
        print(request)
        
        let session = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else{return}
            do{
                let users = try JSONDecoder().decode(ListRepo.self, from: data)
                print(users)
                success?(users)
            }catch{
                print(error)
                failure?(error)
            }
        }
        return session.resume()
    }
    
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

enum Method: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

typealias EndpointType = (path: String, method: Method)

protocol Endpoint {
    var urlString: String { get }
    var path: EndpointType { get }
    var url: URL { get }
    var method: Method { get }
}

enum GithubEndpoint: Endpoint {
    case repositories(_ page: Int, _ perPage: Int)
    
    internal var urlString: String {
        return "https://api.github.com"
    }
    
    internal var path: EndpointType {
        switch self {
        case .repositories(let page, let perPage):
            return (path: "/search/repositories?q=language:swift&sort=stars&page=\(page)&per_page=\(perPage)", method: .get)
        }
    }
    
    var method: Method {
        return path.method
    }
    
    var url: URL {
        return URL(string: urlString + path.path)!
    }
}

