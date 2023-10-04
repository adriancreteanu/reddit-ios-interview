//
//  FeedViewController.swift
//  RickAndMorty
//
//  Created by Adrian Creteanu on 04.10.2023.
//

import Combine
import UIKit

final class FeedViewController: UITableViewController {
    // MARK: - Properties
    
    private var viewModel: FeedViewModelDelegate
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Lifecycle
    
    init(viewModel: FeedViewModelDelegate) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        viewModel.dataPublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] shouldReload in
                guard shouldReload else { return }
            
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
        
        viewModel.fetchCharacters()
    }

    private func setup() {
        view.backgroundColor = .white
        
        let nib = UINib(nibName: FeedItemTableViewCell.reuseIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: FeedItemTableViewCell.reuseIdentifier)
    }
}

extension FeedViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedItemTableViewCell.reuseIdentifier, for: indexPath) as? FeedItemTableViewCell else {
            fatalError("Dequeued cell is of incorrect type.")
        }
        
        let item = viewModel.item(atRow: indexPath.row)
        cell.configure(model: item)

        return cell
    }
}
