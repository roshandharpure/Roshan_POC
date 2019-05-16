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
        tableView?.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = 44.0
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(tableView!)
        tableView?.register(DetailCell.self, forCellReuseIdentifier:DETAIL_CELL)
        setupLayout()
    }
    
    func setupLayout(){
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            tableView?.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
            tableView?.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant:5).isActive = true
            tableView?.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
            tableView?.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 5).isActive = true
        } else {
            // Fallback on earlier version
            tableView?.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 5).isActive = true
            tableView?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant:5).isActive = true
            tableView?.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5).isActive = true
            tableView?.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 5).isActive = true
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        CountryViewModel.fetchCountryDetails(completionHandler: { (countryData, error) in
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
