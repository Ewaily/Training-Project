//
//  ProfileView.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/7/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileView: UIViewController, cellDelegate {
    func navigate(name: String, identifier: String) {
        if let lTabBar = self.tabBarController as? TabBar {
            lTabBar.selectedIndex = 2
        }
//        if let viewController = UIStoryboard(name: name, bundle: nil).instantiateViewController(withIdentifier: identifier) as? NotificationsViewController {
//            if let navigator = navigationController {
//
//                navigator.pushViewController(viewController, animated: true)
//            }
//        }

    }
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    let facilities: [FacilityModel] = FacilityModel.creatCellData()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let ltabBarController = self.tabBarController as? TabBar {
            setupView(currentUser: ltabBarController.currentUser!)
        }
        setupTable()
    }

    func setupView(currentUser: UserModel) {
        nameLabel.text = currentUser.name
        emailLabel.text = currentUser.email
        mobileLabel.text = (currentUser.mobile)?.description
        loadImage(avatarURL: currentUser.avatarURL ?? "")
    }

    func loadImage(avatarURL: String) {
        let imageURL = URL(string: avatarURL)
        avatarImage.sd_setImage(with: imageURL, placeholderImage: #imageLiteral(resourceName: "ProfilePicture"))

    }
    
    func setupTable() {
        let FacilitiesXibFile = UINib(nibName: "FacilitiesTableViewCell", bundle: nil)
        tableView.register(FacilitiesXibFile, forCellReuseIdentifier: "FacilityCell")
        let NotificationsProfileXibFile = UINib(nibName: "NotificationsAndProfileTableViewCell", bundle: nil)
        tableView.register(NotificationsProfileXibFile, forCellReuseIdentifier: "NotifiAndProfileCell")
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = 60
        //tableView.contentInset.top = 30
    }
}


extension ProfileView: UITableViewDelegate {
}

extension ProfileView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 1
        default:
            return facilities.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotifiAndProfileCell") as! NotificationsAndProfileTableViewCell
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        default:
            let data = facilities[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "FacilityCell") as! FacilitiesTableViewCell
            cell.configureCell(cellData: data)
            cell.selectionStyle = .none
            return cell
        }
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0:
//            return nil
//        default:
//            return "Facilities"
//        }
//    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 || section == 2 || section == 3{
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 46))
            let titleLabel = UILabel(frame: CGRect(x: 44, y: 15, width: 120, height: 26))
            titleLabel.text = "Facilities"
            titleLabel.textColor = UIColor.init(rgb: 0x525c68)
            headerView.backgroundColor = .white
            headerView.addSubview(titleLabel)
            
            return headerView
        }
        
        
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 || section == 2 || section == 3 {
            return 46
        }
        return 0
    }
    
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
//        view.tintColor = UIColor.systemBackground
//        let header = view as! UITableViewHeaderFooterView
//        header.textLabel?.textColor = UIColor.init(rgb: 0x525c68)
//    }
}
