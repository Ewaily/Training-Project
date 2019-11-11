//
//  FacilitiesTableViewCell.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/7/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class FacilitiesTableViewCell: UITableViewCell {

    @IBOutlet weak var cellUIView: UIView!
    @IBOutlet weak var facilityImageView: UIImageView!
    @IBOutlet weak var facilityLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        drawShadow()
        cellUIView.layer.cornerRadius = 7.5
    }

    func drawShadow() {
        cellUIView.layer.shadowColor = UIColor.gray.cgColor
        cellUIView.layer.shadowOpacity = 1
        cellUIView.layer.shadowOffset = .zero
        cellUIView.layer.shadowRadius = 10
    }
    
    func configureCell (cellData: FacilityModel){
        facilityImageView.image = cellData.facilityPic
        facilityLabel.text = cellData.facilityTitle
    }
}
