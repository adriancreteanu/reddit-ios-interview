//
//  FeedViewModel.swift
//  RickAndMorty
//
//  Created by Adrian Creteanu on 04.10.2023.
//

import Foundation

final class FeedViewModel {
    // MARK: - Properties
    
    private var service: FeedService
    private var characters = [Character]()
    
    @Published private var shouldReload = false
    @Published private var error: Error?
    
    var dataPublisher: Published<Bool>.Publisher { $shouldReload }
    var errorPublisher: Published<Error?>.Publisher { $error }
    
    init(service: FeedService) {
        self.service = service
    }
    
    // MARK: - Network
    
    func fetchCharacters() {
        service.fetchCharacters { [weak self] result in
            switch result {
            case let .success(characters):
                self?.characters = characters
                self?.shouldReload = true
                
            case let .failure(error):
                self?.error = error
            }
        }
    }
}

extension FeedViewModel: FeedViewModelDelegate {
    var numberOfItems: Int {
        characters.count
    }
    
    func item(atRow row: Int) -> Character {
        characters[row]
    }
}
