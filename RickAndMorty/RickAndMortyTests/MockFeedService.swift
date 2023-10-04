//
//  MockFeedService.swift
//  RickAndMortyTests
//
//  Created by Adrian Creteanu on 04.10.2023.
//

import Foundation
@testable import RickAndMorty

class MockFeedService: FeedService {
    let dummyCharacters: [Character] = [
        Character(name: "Rick", image: "www.any-url.com"),
        Character(name: "Morty", image: "www.any-url-2.com")
    ]

    func fetchCharacters(completion: @escaping (Result<[RickAndMorty.Character], Error>) -> Void) {
        completion(.success(dummyCharacters))
    }
}
