//
//  Facility.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/11/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Foundation
import UIKit

class FacilityModel {
    
    var facilityPic: UIImage
    var facilityTitle: String
    
    init(facilityPic: UIImage, facilityTitle: String) {
        self.facilityPic = facilityPic
        self.facilityTitle = facilityTitle
    }
    
    static func creatCellData() -> [FacilityModel] {
        var tempData: [FacilityModel] = []
        let facility1 = FacilityModel(facilityPic: #imageLiteral(resourceName: "DryCleaning"), facilityTitle: "Dry Cleaning")
        let facility2 = FacilityModel(facilityPic: #imageLiteral(resourceName: "BarberShop"), facilityTitle: "Barber Shop")
        let facility3 = FacilityModel(facilityPic: #imageLiteral(resourceName: "Restaurant"), facilityTitle: "Restaurant")
        let facility4 = FacilityModel(facilityPic: #imageLiteral(resourceName: "Spa"), facilityTitle: "Physiotherapy/Spa")
        let facility5 = FacilityModel(facilityPic: #imageLiteral(resourceName: "Massage"), facilityTitle: "Massage")
        let facility6 = FacilityModel(facilityPic: #imageLiteral(resourceName: "Gym"), facilityTitle: "Gym")
        
        tempData.append(facility1)
        tempData.append(facility2)
        tempData.append(facility3)
        tempData.append(facility4)
        tempData.append(facility5)
        tempData.append(facility6)
        return tempData
    }
}
