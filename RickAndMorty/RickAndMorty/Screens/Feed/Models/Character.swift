//
//  Character.swift
//  RickAndMorty
//
//  Created by Adrian Creteanu on 04.10.2023.
//

import Foundation

struct Character: Decodable, Equatable {
    let name: String
    let image: String
}

struct CharacterResponse: Decodable {
    let results: [Character]
}
