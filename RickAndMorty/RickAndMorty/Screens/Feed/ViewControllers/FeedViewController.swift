//
//  FeedViewController.swift
//  RickAndMorty
//
//  Created by Adrian Creteanu on 04.10.2023.
//

import UIKit

final class FeedViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    private func setupTableView() {
        let nib = UINib(nibName: FeedItemTableViewCell.reuseIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: FeedItemTableViewCell.reuseIdentifier)
    }
}

extension FeedViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedItemTableViewCell.reuseIdentifier, for: indexPath) as? FeedItemTableViewCell else {
            fatalError("Dequeued cell is of incorrect type.")
        }

        return cell
    }
}
