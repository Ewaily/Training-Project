//
//  Alert.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/6/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String, alertStyle: UIAlertController.Style ,defaultHandler: ((UIAlertAction) -> Void)?,cancelHandler: ((UIAlertAction) -> Void)?, defaultActionTitle: String?, cancelActionTitle: String?, destructiveActionTitle: String?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        if let defaultAction = defaultActionTitle {
            alert.addAction(UIAlertAction(title: defaultAction, style: .default, handler: defaultHandler))
        }
        if let cancelAction = cancelActionTitle {
            alert.addAction(UIAlertAction(title: cancelAction, style: .cancel, handler: cancelHandler))
        }
        if let destructiveAction = destructiveActionTitle {
            alert.addAction(UIAlertAction(title: destructiveAction, style: .destructive, handler: nil))
        }
        present(alert, animated: true, completion: nil)
    }
}
