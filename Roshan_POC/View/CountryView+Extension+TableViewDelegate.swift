//
//  CountryView+Extesnion+TableViewDelegate.swift
//  Roshan_POC
//
//  Created by Roshan Dharpure on 16/05/19.
//  Copyright © 2019 Roshan Dharpure. All rights reserved.
//

import UIKit

extension CountryView:UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return countryViewModel?.details?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.size.width, height: 5))
        footerView.backgroundColor = UIColor.gray
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var detailCell:DetailCell? = tableView.dequeueReusableCell(withIdentifier: DETAIL_CELL, for: indexPath) as? DetailCell
        
        if detailCell == nil {
            detailCell = DetailCell.init(style: .default, reuseIdentifier: DETAIL_CELL)
        }
        let details = countryViewModel?.details![indexPath.section]
        detailCell?.lblTitle.text = details?.title ?? "NA"
        detailCell?.lblDescription.text = details?.description ?? "NA"
        detailCell?.imgRefrenceView.image = UIImage.init(named: PLACEHOLDER_IMAGE)
        detailCell?.layoutIfNeeded()
        //Download Image asynchronously
        if let imgRefUrl = details?.imageHref{
            detailCell?.imgRefrenceView.pin_updateWithProgress = true
            if let url = URL.init(string: imgRefUrl){
                detailCell?.imgRefrenceView.pin_setImage(from: url)
            }
        }
        return detailCell!
    }
}
