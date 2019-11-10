//
//  UserInfoViewModel.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/7/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Foundation

struct LoginViewModel {
    var user: User
    
    init(user: User) {
        
        self.user = user
    }
    
    var name: String {
        return self.user.name!
    }
    
    var email: String {
        return self.user.email!
    }
    
    var mobile: Double {
        return self.user.mobile!
    }
    
    var coupons: [String: Int] {
        return self.user.coupons
    }
    
    var total_saving: String {
        return self.user.total_saving!
    }

}
