//
//  NotificationsAndProfileTableViewCell.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/11/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

protocol cellDelegate {
    func navigate(name: String, identifier: String)
}

class NotificationsAndProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var notificationsView: UIView!
    @IBOutlet weak var profileView: UIView!
    
    var delegate : cellDelegate?
    
    @IBAction func pressNotificationsButton(_ sender: UIButton) {
        if delegate != nil {
            print("pressed")
            delegate?.navigate(name: "Notification", identifier: "Notification")
        }
    }
    
    @IBAction func pressProfileButton(_ sender: UIButton) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        drawShadow(cell: notificationsView)
        drawShadow(cell: profileView)
    }

    func drawShadow(cell: UIView) {
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOpacity = 1
        cell.layer.shadowOffset = .zero
        cell.layer.shadowRadius = 10
    }
    
}


