//
//  LogoutViewController.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/14/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class LogoutViewController: UIViewController {

    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        
        showAlert(title: "Logout", message: "Are you sure you want to Logout?", alertStyle: .alert, defaultHandler: { (UIAlertAction) in
            (UIApplication.shared.delegate as? AppDelegate)?.userManager.deleteUser()

            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Main") as? LoginViewController {
                if let navigator = self.navigationController {
                      navigator.pushViewController(viewController, animated: true)
                  }
              }
        }, cancelHandler: nil, defaultActionTitle: "Yes", cancelActionTitle: "Cancel", destructiveActionTitle: nil)
        
        
        
        
        
//        let alert = UIAlertController(title: "Logout", message: "Are you sure you want to Logout?", preferredStyle: UIAlertController.Style.actionSheet)
//        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (UIAlertAction) in
//            (UIApplication.shared.delegate as? AppDelegate)?.userManager.deleteUser()
//
//            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Main") as? LoginViewController {
//                if let navigator = self.navigationController {
//                      navigator.pushViewController(viewController, animated: true)
//                  }
//              }
//
//        }))
//
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//        self.present(alert, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
