//
//  User.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/6/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserModel {
    var name: String?
    var email: String?
    var mobile: Double?
    var coupons: [String: Int] = ["added": 0, "redeemed": 0, "viewed": 0, "wishlist": 0]
    var total_saving: String?
    
    class func parseLogin(from value :JSON){
        let currentUser = UserModel()
        for reply in value.array! {
                guard let reply = reply.dictionary else { return  }
                   currentUser.name = reply["name"]?.string ?? ""
//                   currentUser.email = data["email"]?.string ?? "nil"
//                   currentUser.mobile = data["mobile"]?.double ?? 0000
//                   currentUser.total_saving = json[0]["coupons"]["total_saving"].string ?? "nil"
//                   currentUser.coupons["viewed"] = json[0]["coupons"]["viewed"].int ?? 0
//                   currentUser.coupons["added"] = json[0]["coupons"]["added"].int ?? 0
//                   currentUser.coupons["redeemed"] = json[0]["coupons"]["redeemed"].int ?? 0
//                   currentUser.coupons["wishlist"] = json[0]["coupons"]["wishlist"].int ?? 0

           }
    }
}

