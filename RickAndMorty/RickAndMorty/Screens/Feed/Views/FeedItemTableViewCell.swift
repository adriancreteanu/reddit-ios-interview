//
//  FeedItemTableViewCell.swift
//  RickAndMorty
//
//  Created by Adrian Creteanu on 04.10.2023.
//

import UIKit

final class FeedItemTableViewCell: UITableViewCell {
    @IBOutlet var avatarImageVIew: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    private func setup() {
        avatarImageVIew.layer.cornerRadius = 60
        avatarImageVIew.backgroundColor = .blue
    }
}
