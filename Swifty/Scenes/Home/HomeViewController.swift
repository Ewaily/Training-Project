//
//  HomeViewController.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/12/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBAction func employeeButtonPressed(_ sender: UIButton) {
        if let ltabBarController = self.tabBarController as? TabBar {
            ltabBarController.currentUser?.userType = .employee
            navigate(index: 1)
        }
    }
    
    @IBAction func customerButtonPressed(_ sender: UIButton) {
        if let ltabBarController = self.tabBarController as? TabBar {
            ltabBarController.currentUser?.userType = .customer
            navigate(index: 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func navigate(index: Int) {
        if let lTabBar = self.tabBarController as? TabBar {
            lTabBar.selectedIndex = index
        }
    }
}
