//
//  FeedAPIService.swift
//  RickAndMorty
//
//  Created by Adrian Creteanu on 04.10.2023.
//

import Foundation

final class FeedAPIService: FeedService {
    let apiClient: ApiClient

    // MARK: - Init

    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    func fetchCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
        guard let charactersURL = URL(string: Constants.API.Endpoint.allCharacters) else {
            completion(.failure(ApiClient.NetworkError.urlError))
            return
        }

        apiClient.makeRequest(at: charactersURL) { (result: Result<CharacterResponse, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
