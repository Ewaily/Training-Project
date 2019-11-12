//
//  FeedbackTableViewCell.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/12/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class FeedbackTableViewCell: UITableViewCell {

    @IBOutlet weak var cellUIView: UIView!
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
}
