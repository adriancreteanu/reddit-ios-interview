//
//  APIClient.swift
//  RickAndMorty
//
//  Created by Adrian Creteanu on 04.10.2023.
//

import Foundation

class ApiClient {
    enum NetworkError: Swift.Error {
        case noData
        case decodeError
        case urlError
    }
    
    func makeRequest<T: Decodable>(at url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            } else {
                guard let data = data else {
                    completion(.failure(NetworkError.noData))
                    return
                }
                
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(NetworkError.decodeError))
                }
            }
            
        }.resume()
    }
}
