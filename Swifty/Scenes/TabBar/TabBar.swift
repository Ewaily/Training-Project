//
//  TabBar.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/11/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {

    var currentUser = (UIApplication.shared.delegate as? AppDelegate)?.userManager.currentUser
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
