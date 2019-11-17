//
//  ImageTableViewCell.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/16/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    let facilities: [FacilityModel] = FacilityModel.creatCellData()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTable()
    }

    func setupTable() {
        let CollectionViewXibFile = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        collectionView.register(CollectionViewXibFile, forCellWithReuseIdentifier: "CustomCollectionViewCell")
    }
    
}

extension ImageTableViewCell: UICollectionViewDataSource {
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

extension ImageTableViewCell: UICollectionViewDelegate {

}

extension ImageTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width * 0.3, height: frame.height)
    }
}

