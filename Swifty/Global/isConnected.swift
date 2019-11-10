//
//  isConnected.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/10/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Foundation
import Alamofire
class Connection {
    class func  isConnected () -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
