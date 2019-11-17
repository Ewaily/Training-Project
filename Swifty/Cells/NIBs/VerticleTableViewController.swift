//
//  VerticleTableViewController.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/17/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class VerticleTableViewController: UITableViewCell {
        
    @IBOutlet weak var collectionView: UICollectionView!
    let facilities: [FacilityModel] = FacilityModel.creatCellData()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTable()
    }

    func setupTable() {
        let lCollectionViewXibFile = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        collectionView.register(lCollectionViewXibFile, forCellWithReuseIdentifier: "CustomCollectionViewCell")
    }
    
}

extension VerticleTableViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return facilities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = facilities[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        cell.configureCell(cellData: data)
        return cell
            }
    
    
}

extension VerticleTableViewController: UICollectionViewDelegate {

}

extension VerticleTableViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - padding

        return CGSize(width: collectionViewSize/2, height: 120)
    }
}
