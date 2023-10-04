//
//  FeedViewModelDelegate.swift
//  RickAndMorty
//
//  Created by Adrian Creteanu on 04.10.2023.
//

import Foundation

protocol FeedViewModelDelegate {
    
    // Combine
    
    var dataPublisher: Published<Bool>.Publisher { get }
    var errorPublisher: Published<Error?>.Publisher { get }
    
    func fetchCharacters()
    
    
    // Data Source
    
    var numberOfItems: Int { get }
    
    func item(atRow row: Int) -> Character
    
}
