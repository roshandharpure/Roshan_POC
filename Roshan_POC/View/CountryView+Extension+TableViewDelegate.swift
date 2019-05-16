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

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var detailCell:DetailCell? = tableView.dequeueReusableCell(withIdentifier: DETAIL_CELL) as? DetailCell
        
        if detailCell == nil {
            detailCell = DetailCell.init(style: .default, reuseIdentifier: DETAIL_CELL)
        }
        let details = countryViewModel?.details![indexPath.section]
        
        detailCell?.lblTitle.text = details?.title ?? "NA"
        detailCell?.lblDescription.text = details?.description ?? "NA"
        
        return detailCell!
    }
}
