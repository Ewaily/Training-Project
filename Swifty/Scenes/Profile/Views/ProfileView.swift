//
//  ProfileView.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/7/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class ProfileView: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorColor = .groupTableViewBackground
        let discoverXibFile = UINib(nibName: "FacilitiesTableViewCell", bundle: nil)
        tableView.register(discoverXibFile, forCellReuseIdentifier: "FacilityCell")
        
        tableView.contentInset.top = 30
    }

}

extension ProfileView: UITableViewDelegate {
}

extension ProfileView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FacilityCell") as! FacilitiesTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    

}
