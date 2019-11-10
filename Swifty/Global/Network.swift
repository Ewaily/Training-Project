//
//  Network.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/6/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

class Login: NSObject {
    class func login(para: [String: String], completion: @escaping (_ error: Error?, _ success: Bool, _ userModel:UserModel) -> Void) {
        let SigninEndpoint = URLs.login
        AF.request(SigninEndpoint, method: HTTPMethod.post, parameters: para)
            .validate()
            .responseJSON { response in
            switch response.result {
            case .success(let value):
                guard  let json = JSON(value).array else { return }
                //print(json)
                
                let currentUser = UserModel()

                for data in json {
                    guard let data = data.dictionary else {
                        return
                    }
                    currentUser.name = data["name"]?.string ?? ""
//                    currentUser.email = data["email"]?.string ?? "nil"
//                    currentUser.mobile = data["mobile"]?.double ?? 0000
//                    currentUser.total_saving = json[0]["coupons"]["total_saving"].string ?? "nil"
//                    currentUser.coupons["viewed"] = json[0]["coupons"]["viewed"].int ?? 0
//                    currentUser.coupons["added"] = json[0]["coupons"]["added"].int ?? 0
//                    currentUser.coupons["redeemed"] = json[0]["coupons"]["redeemed"].int ?? 0
//                    currentUser.coupons["wishlist"] = json[0]["coupons"]["wishlist"].int ?? 0
                }
                completion(nil, true, currentUser)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
