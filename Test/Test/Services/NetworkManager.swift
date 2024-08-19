//
//  NetworkManager.swift
//  Test
//
//  Created by Oleg Lesnoy on 16.08.2024.
//

import Foundation
enum NetworkError: Error {
    case badData
}

protocol NetworkManagerProtocol {
    var url: URL? {get set}
    func fetchData(completion: @escaping (Result<ReceivedData, Error>) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
    private init() {}
    var url: URL?
    
    func fetchData(completion: @escaping (Result<ReceivedData, Error>) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.jsonbin.io"
        urlComponents.path = "/v3/b/655b754e0574da7622c94aa4"
        url = urlComponents.url
        
        guard let url else {
            completion(.failure(URLError(.badURL)))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error {
                completion(.failure(error))
                return
            }
            guard let data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
    
            let jsonData = try? JSONDecoder().decode(ReceivedData.self, from: data)
            
            guard let jsonData else {
                completion(.failure(NetworkError.badData))
                return
            }
            completion(.success(jsonData))
        }.resume()
    }
}
