//
//  FeedViewModelTests.swift
//  RickAndMortyTests
//
//  Created by Adrian Creteanu on 04.10.2023.
//

@testable import RickAndMorty
import XCTest

final class FeedViewModelTests: XCTestCase {
    
    private var viewModel: FeedViewModelDelegate!
    
    override func setUp() {
        super.setUp()
        
        let mockFeedService = MockFeedService()
        viewModel = FeedViewModel(service: mockFeedService)
    }
    
    func testCharacterListEmptyInitially() {
        XCTAssertEqual(viewModel.numberOfItems, 0)
    }
    
    func testCharacterListProperties() {
        viewModel.fetchCharacters()

        XCTAssertEqual(viewModel.numberOfItems, 2)
        
        let expectedItem = Character(name: "Rick", image: "www.any-url.com")
        XCTAssertEqual(viewModel.item(atRow: 0), expectedItem)
    }
}
