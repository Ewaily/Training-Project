//
//  ProfileView.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/7/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileView: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    let facilities: [FacilityModel] = FacilityModel.creatCellData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupView()
        setupTable()

    }

//    func setupView() {
//        nameLabel.text = currentUser?.name
//        emailLabel.text = currentUser?.email
//        mobileLabel.text = (currentUser?.mobile)?.description
//        loadImage()
//    }
//
//    func loadImage() {
//        let imageURL = URL(string: currentUser!.avatarURL!)
//        avatarImage.sd_setImage(with: imageURL, placeholderImage: #imageLiteral(resourceName: "ProfilePicture"))
//
//    }
    
    func setupTable() {
        tableView.separatorColor = .groupTableViewBackground
        let FacilitiesXibFile = UINib(nibName: "FacilitiesTableViewCell", bundle: nil)
        tableView.register(FacilitiesXibFile, forCellReuseIdentifier: "FacilityCell")
        let NotificationsProfileXibFile = UINib(nibName: "NotificationsAndProfileTableViewCell", bundle: nil)
        tableView.register(NotificationsProfileXibFile, forCellReuseIdentifier: "NotifiAndProfileCell")

        tableView.contentInset.top = 30
    }
}


extension ProfileView: UITableViewDelegate {
}

extension ProfileView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 1
        default:
            return facilities.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotifiAndProfileCell") as! NotificationsAndProfileTableViewCell
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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return nil
        default:
            return "Facilities"
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.systemBackground
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.init(rgb: 0x525c68)
    }
}
