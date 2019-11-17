//
//  GalleryPagerCellCollectionViewCell.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/17/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit
import FSPagerView

class GalleryPagerCellCollectionViewCell: FSPagerViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelMask: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell (cellData: FacilityModel){
        image.image = cellData.facilityPic
        label.text = cellData.facilityTitle
    }
}
