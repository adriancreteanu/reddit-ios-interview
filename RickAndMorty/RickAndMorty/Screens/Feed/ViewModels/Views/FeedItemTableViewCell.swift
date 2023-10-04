//
//  FeedItemTableViewCell.swift
//  RickAndMorty
//
//  Created by Adrian Creteanu on 04.10.2023.
//

import UIKit

final class FeedItemTableViewCell: UITableViewCell {
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.height / 2
    }
    
    // MARK: - Setup
    
    func configure(model: Character) {
        nameLabel.text = model.name
        
        if let url = URL(string: model.image) {
            avatarImageView.load(url: url)
        } else {
            avatarImageView.backgroundColor = .lightGray
        }
    }
}
