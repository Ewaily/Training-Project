//
//  NetworkCalls.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/10/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
class NetworkCall:NSObject {
    class func login (email:String,password:String, completion: @escaping (Error?,Bool) -> Void ){
        let paramters = ["email":email,"password":password]
        AF.request(NetworkMethod.login(paramters)) .validate() .responseJSON { respone in
            switch respone.response?.statusCode {
            case 401:
                completion(nil,false)
            case 200:
                let json = JSON(respone.result)
                UserModel.parseLogin(from: json)
                completion(nil,true)
            default:
                break
            }
        }
        
    }
}
