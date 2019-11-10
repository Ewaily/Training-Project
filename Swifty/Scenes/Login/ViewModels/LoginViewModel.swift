//
//  LoginViewModel.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/7/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    
    private let userModel: UserModel
    
    init(userModel: UserModel) {
        self.userModel = userModel
    }
    
    var userName: String {
        return userModel.name ?? ""
    }

}
