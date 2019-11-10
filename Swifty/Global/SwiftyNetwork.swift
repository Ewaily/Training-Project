//
//  SwiftyNetwork.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/10/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkMethod :URLRequestConvertible {
    case login([String: Any])
    case register([String: Any])
    case getProfileInfo
    case editProfileInfo([String: Any])
 
    func asURLRequest() throws -> URLRequest {
        var method : HTTPMethod {
            switch self {
            case .login , .editProfileInfo , .register :
                return .post
            case .getProfileInfo:
                return .get
                
            }
        }
        
    let parameters : ([String: Any]?) = {
            switch self {
            case .login(let para) , .editProfileInfo(let para) , .register(let para):
                return para
            case .getProfileInfo:
                return nil
            }
        }()
        
    let url : URL = {
            let destURL : String?
            switch  self {
            case .login:
                destURL = URLs.login
            case .register:
                destURL = URLs.register
            case .getProfileInfo:
                destURL = URLs.getProfileInfo
            case .editProfileInfo:
                destURL = URLs.editProfileInfo
            }
            var url : URL!
            if let destURL = destURL {
                url = URL(string: destURL)
            }
            return url

    }()
        
    var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        let encoding : ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
    return try encoding.encode(urlRequest, with: parameters)

 }
    
}
