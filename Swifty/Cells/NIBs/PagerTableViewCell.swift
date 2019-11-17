//
//  PagerTableViewCell.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/16/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit
import FSPagerView

class PagerTableViewCell: UITableViewCell {

    @IBOutlet weak var pager: FSPagerView!
    let facilities: [FacilityModel] = FacilityModel.creatCellData()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupPager()
        
    }
    
    private func setupPager(){
        let CollectionViewXibFile = UINib(nibName: "GalleryPagerCellCollectionViewCell", bundle: nil)
        pager.register(CollectionViewXibFile, forCellWithReuseIdentifier: "GalleryPagerCellCollectionViewCell")
        pager.isInfinite = true
        pager.automaticSlidingInterval = 3.0
        pager.transformer = FSPagerViewTransformer(type: .linear)
        pager.layer.masksToBounds = true
        pager.layer.cornerRadius = 4
    }
}

extension PagerTableViewCell: FSPagerViewDelegate, FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 5
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let data = facilities[index]
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "GalleryPagerCellCollectionViewCell", at: index) as! GalleryPagerCellCollectionViewCell
        cell.configureCell(cellData: data)
        cell.contentMode = .scaleAspectFill
        return cell
    }
    
    
}
