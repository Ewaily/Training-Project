//
//  CustomCollectionViewCell.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/16/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell (cellData: FacilityModel){
        image.image = cellData.facilityPic
        label.text = cellData.facilityTitle
    }
}

