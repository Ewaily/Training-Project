//
//  UserManager.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/11/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Foundation

class UserManager {
    var currentUser: UserModel?
    static var sharedUserManager: UserManager = {
        let userManager = UserManager()
        return userManager
    }()
    private init () {
    }
    
    func deleteUser() {
        currentUser?.deleteUserData()
    }
    
    func checkUser() -> Bool {
        loadUser()
        return currentUser != nil
    }
    
    func loadUser() {
        currentUser = UserModel.loadUserData()
    }
    
    func saveUser(user: UserModel) {
        self.currentUser = user
        currentUser?.saveUserData()
    }
}

