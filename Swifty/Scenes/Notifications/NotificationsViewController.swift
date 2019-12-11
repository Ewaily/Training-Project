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
        let VerticleXibFile = UINib(nibName: "VerticleTableViewController", bundle: nil)
        tableView.register(VerticleXibFile, forCellReuseIdentifier: "VerticleTableViewController")
        tableView.reloadData()
        tableView.estimatedRowHeight = UITableView.automaticDimension
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
                pagerCell.backgroundColor = .red
            return pagerCell
            }
        case 1:
            if let imageCell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell") as? ImageTableViewCell {
                imageCell.backgroundColor = .green
           return imageCell
            }
        case 2:
            if let verticalCell = tableView.dequeueReusableCell(withIdentifier: "VerticleTableViewController") as? VerticleTableViewController {
                verticalCell.backgroundColor = .yellow
                return verticalCell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return tableView.frame.height * 0.4
        case 1:
            return 150
        case 2:
            print(UITableView.automaticDimension)
            return UITableView.automaticDimension

        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 || section == 2 {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30))
            let titleLabel = UILabel(frame: CGRect(x: 44, y: 15, width: 120, height: 20))
            titleLabel.text = "Facilities"
            headerView.backgroundColor = .blue
            titleLabel.textColor = .black
            headerView.addSubview(titleLabel)
            
            return headerView
        }
        
        
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 || section == 2 {

            return 46
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
}
