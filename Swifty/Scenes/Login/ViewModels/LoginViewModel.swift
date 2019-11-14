//
//  LoginViewModel.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/7/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    private var userModel: UserModel?
    
    func setUser (userModel: UserModel) {
        self.userModel = userModel
    }
        
    var userName: String {
        return userModel?.name ?? ""
    }

    func sendRequest(email: String, password: String, completion: @escaping (Error?,UserModel?) -> Void ){
        NetworkCall.login(email: email, password: password) { (error:Error?, userModel: UserModel?) in
            if let lUserModel = userModel  {
                completion(nil,lUserModel)
            }
            else {
                completion(error,nil)
            }
        }
    }
}
