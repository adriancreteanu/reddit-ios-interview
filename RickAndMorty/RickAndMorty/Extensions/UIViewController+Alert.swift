//
//  UIViewController+Alert.swift
//  RickAndMorty
//
//  Created by Adrian Creteanu on 04.10.2023.
//

import UIKit

extension UIViewController {
    func showAlert(
        title: String?,
        message: String?,
        actionTitle: String? = "OK"
    ) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        let action = UIAlertAction(title: actionTitle, style: .default)
        alertController.addAction(action)

        present(alertController, animated: true, completion: nil)
    }
}
