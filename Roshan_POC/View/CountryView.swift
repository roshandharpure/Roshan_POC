//
//  CountryView.swift
//  Roshan_POC
//
//  Created by Roshan Dharpure on 16/05/19.
//  Copyright © 2019 Roshan Dharpure. All rights reserved.
//

import UIKit

class CountryView: UIViewController {
    var tableView:UITableView?
    var countryViewModel:CountryViewModel?
    var countryData:Country?{
        didSet{
            guard let countryData = countryData else {return}
            countryViewModel = CountryViewModel.init(country: countryData)
            DispatchQueue.main.async {
                self.updateView()
            }
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.setupViews()
    }
    
    func setupViews(){
        view.backgroundColor = UIColor.white
        tableView = UITableView.init(frame: view.frame)
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = 200
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(tableView!)
        tableView?.register(DetailCell.self, forCellReuseIdentifier:DETAIL_CELL)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        countryViewModel?.fetchCountryDetails(completionHandler: { (countryData, error) in
            if let _ = error{
                return
            }
            guard let countryData = countryData else{return}
            self.countryData = countryData
            
        })
    }
    
    func updateView(){
        self.title = self.countryViewModel?.title
        self.tableView?.reloadData()
    }
}
