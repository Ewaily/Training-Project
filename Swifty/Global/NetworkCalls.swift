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
    class func login (email:String,password:String, completion: @escaping (Error?,UserModel?) -> Void ){
        let paramters = ["email":email,"password":password,"locale": "EN"]
        AF.request(NetworkMethod.login(paramters)) .validate() .responseJSON { respone in
            
            switch respone.result{
            case .success(let value):
                guard let json = JSON(value).array else { return }
                let userModel =  UserModel(from: json)
                completion(nil,userModel)
            case .failure(let error):
                completion(error, nil)
                break
            }
        }
        
    }
}
