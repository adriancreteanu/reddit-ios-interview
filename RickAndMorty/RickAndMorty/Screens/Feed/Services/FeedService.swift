//
//  FeedService.swift
//  RickAndMorty
//
//  Created by Adrian Creteanu on 04.10.2023.
//

import Foundation

protocol FeedService {
    func fetchCharacters(completion: @escaping (Result<[Character], Error>) -> Void)
}
