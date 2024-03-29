//
//  User.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/6/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserModel: Codable {
    var name: String?
    var email: String?
    var mobile: Double?
    var avatarURL: String?
    var coupons: Coupon?
    var tokens: [Token]?
    var userType: UserType?
    
    required init(from value :[JSON]) {
        
        for reply in value {
         guard let reply = reply.dictionary else {return}
            self.name = reply["name"]?.string ?? ""
            self.email = reply["email"]?.string ?? ""
            self.mobile = reply["mobile"]?.double ?? 0000
            self.avatarURL = reply["avatar"]?.string ?? ""
            coupons = Coupon(reply: reply)
            if let lTokens = reply["tokens"]?.array{tokens = Token.parseTokens(reply: lTokens)}
            self.userType = .customer
        }
    }
    
    func saveUserData(){
        do{
            let encodedData = try PropertyListEncoder().encode(self)
            UserDefaults.standard.set(encodedData, forKey: "SwiftyUser")
            print("SUCCESS SAVE USER DATA")
        } catch{
            print("Can not Encode User Data \(error)")
        }
    }
    
    func deleteUserData(){
        UserDefaults.standard.removeObject(forKey: "SwiftyUser")
    }
    
    static func loadUserData() -> UserModel?{
        var user: UserModel?
        
        do{
            if let encodedData = UserDefaults.standard.value(forKey: "SwiftyUser") as? Data {
                user = try PropertyListDecoder().decode(UserModel.self,from: encodedData)
            }
            else{
                print("Failed to load encoded data from user Defaults")
            }
        }
        catch{
            print("ERROR Decoding User Data from Cache \(error)")
        }
        
        return user
    }
    
    static func clearUserData(){
        UserDefaults.standard.removeObject(forKey: "SwiftyUser")
    }
}

enum UserType: String, Codable {
    case employee
    case customer
}

class Coupon: Codable {
    var added: Int?
    var redeemed: Int?
    var viewed: Int?
    var wishlist: Int?
    var totalSaving: String?
    
    required init(reply:[String : JSON]) {
        self.added = reply["coupons"]?["added"].int ?? 0
        self.redeemed = reply["coupons"]?["redeemed"].int ?? 0
        self.viewed = reply["coupons"]?["viewed"].int ?? 0
        self.wishlist = reply["coupons"]?["wishlist"].int ?? 0
        self.totalSaving = reply["coupons"]?["total_saving"].string ?? ""
    }
}

class Token: Codable {
    var id: Int?
    var userId: Int?
    var token: String?
    var apns: String?
    var createdAt: String?
    var updatedAt: String?
    
    static func parseTokens(reply:[JSON]) -> [Token]? {
        var tokens = [Token]()
        
        for data in reply {
            guard let data = data.dictionary else {
                return nil
            }
            let token = Token()
            token.id = data["id"]?.int ?? 0
            token.userId = data["user_id"]?.int ?? 0
            token.token = data["token"]?.string ?? ""
            token.apns = data["apns"]?.string ?? ""
            token.createdAt = data["created_at"]?.string ?? ""
            token.updatedAt = data["updated_at"]?.string ?? ""
            tokens.append(token)
        }
        return tokens
    }
}

