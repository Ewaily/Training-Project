//
//  NotificationsViewController.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/12/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    func setupTable() {
        let PagerXibFile = UINib(nibName: "PagerTableViewCell", bundle: nil)
        tableView.register(PagerXibFile, forCellReuseIdentifier: "PagerTableViewCell")
        let ImageXibFile = UINib(nibName: "ImageTableViewCell", bundle: nil)
        tableView.register(ImageXibFile, forCellReuseIdentifier: "ImageTableViewCell")
    }

}

extension NotificationsViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let pagerCell = tableView.dequeueReusableCell(withIdentifier: "PagerTableViewCell") as? PagerTableViewCell {
            return pagerCell
            }
        case 1:
            if let imageCell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell") as? ImageTableViewCell {
           return imageCell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return tableView.frame.height * 0.4
        case 1:
            return tableView.frame.height * 0.25
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30))
            let titleLabel = UILabel(frame: CGRect(x: 44, y: 15, width: 120, height: 20))
            titleLabel.text = "Facilities"
            titleLabel.textColor = .black
            headerView.backgroundColor = .white
            headerView.addSubview(titleLabel)
            
            return headerView
        }
        
        
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 46
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
}
