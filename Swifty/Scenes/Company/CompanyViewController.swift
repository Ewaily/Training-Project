//
//  CompanyViewController.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/12/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class CompanyViewController: UIViewController {

    @IBOutlet weak var navigationBarTitle: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    
    var displayArray = [DisplayCells]()
    let facilities: [FacilityModel] = FacilityModel.creatCellData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.title
        setDisplayArray()
        tableView.reloadData()
        
    }

    enum DisplayCells {
        case infoCell
        case facilityCell
        case feedbackCell
    }
    
    func setDisplayArray() {
        if let lTabBar = self.tabBarController as? TabBar {
            let currentUserType = lTabBar.currentUser?.userType
            displayArray.removeAll()
            switch currentUserType {
            case .customer:
                navigationBarTitle.title = "Customer"
                displayArray.append(.infoCell)
                displayArray.append(.facilityCell)
                displayArray.append(.feedbackCell)
            case .employee:
                navigationBarTitle.title = "Employee"
                displayArray.append(.infoCell)
                displayArray.append(.facilityCell)
            case .none:
                break
            }
        }
    }
    
    func setupTable() {
        let FacilitiesXibFile = UINib(nibName: "FacilitiesTableViewCell", bundle: nil)
        tableView.register(FacilitiesXibFile, forCellReuseIdentifier: "FacilityCell")
        let NotificationsProfileXibFile = UINib(nibName: "NotificationsAndProfileTableViewCell", bundle: nil)
        tableView.register(NotificationsProfileXibFile, forCellReuseIdentifier: "NotifiAndProfileCell")
        let FeedbackProfileXibFile = UINib(nibName: "FeedbackTableViewCell", bundle: nil)
        tableView.register(FeedbackProfileXibFile, forCellReuseIdentifier: "FeedbackCell")
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = 60
    }
}

extension CompanyViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch displayArray[section] {
        case .facilityCell:
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 46))
            let titleLabel = UILabel(frame: CGRect(x: 44, y: 15, width: 120, height: 26))
            titleLabel.text = "Facilities"
            titleLabel.textColor = UIColor.init(rgb: 0x525c68)
            headerView.backgroundColor = .white
            headerView.addSubview(titleLabel)
            return headerView
        default:
            return UIView()

        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
        switch displayArray[section] {
        case .facilityCell:
            return 46
        default:
            return 0
        }
    }
}

extension CompanyViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return displayArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch displayArray[section] {
        case .infoCell:
            return 1
        case .facilityCell:
            return facilities.count
        case .feedbackCell:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch displayArray[indexPath.section] {
        case .infoCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotifiAndProfileCell") as! NotificationsAndProfileTableViewCell
            cell.delegate = self
            return cell
        case .facilityCell:
            let data = facilities[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "FacilityCell") as! FacilitiesTableViewCell
            cell.configureCell(cellData: data)
            return cell
        case .feedbackCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeedbackCell") as! FeedbackTableViewCell
            return cell
        }
    }
}

extension CompanyViewController: cellDelegate {
    
    func navigate(index: Int) {
        if let lTabBar = self.tabBarController as? TabBar {
            lTabBar.selectedIndex = index
        }
    }
}
