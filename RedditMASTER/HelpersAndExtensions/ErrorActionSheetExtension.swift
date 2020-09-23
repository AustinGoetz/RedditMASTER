//
//  ErrorActionSheetExtension.swift
//  RedditMASTER
//
//  Created by Austin Goetz on 9/22/20.
//

import UIKit

extension UIViewController {
    func presentErrorToUser(with localizedError: LocalizedError) {
        let alertController = UIAlertController(title: "Error", message: localizedError.errorDescription, preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
}
