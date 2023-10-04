//
//  UITableViewCell+Identifier.swift
//  RickAndMorty
//
//  Created by Adrian Creteanu on 04.10.2023.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
