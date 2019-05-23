//
//  CountryView.swift
//  Roshan_POC
//
//  Created by Roshan Dharpure on 16/05/19.
//  Copyright © 2019 Roshan Dharpure. All rights reserved.
//

import UIKit
import PINRemoteImage
import SVProgressHUD

class CountryView: UIViewController {
    var tableView: UITableView?
    var refreshControl: UIRefreshControl?

    var countryViewModel: CountryViewModel?
    var countryData: Country? {
        didSet {
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

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //View LifeCycle
    override func viewWillAppear(_ animated: Bool) {
       SVProgressHUD.show()
       self.fetchData()
    }

    func setupViews() {
        view.backgroundColor = UIColor.white
        // Tableview setup
        tableView = UITableView.init(frame: view.bounds)
        tableView?.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(tableView!)
        tableView?.clipsToBounds = true
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = 44.0
        //Setup for XCUITests
        tableView?.accessibilityIdentifier = "table--countryDetailTableView"
        tableView?.register(DetailCell.self, forCellReuseIdentifier: detailCellId)

        //Add refresh control for pull to refresh purpose
        self.refreshControl = UIRefreshControl.init()
        self.refreshControl?.addTarget(self, action: #selector(CountryView.fetchData), for: .valueChanged)
        self.tableView?.addSubview(refreshControl!)
        self.tableView?.allowsSelection = false

        setupLayout()
    }

    func setupLayout() {
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            tableView?.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            tableView?.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
            tableView?.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
            tableView?.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        } else {
            // Fallback on earlier version
            tableView?.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 5).isActive = true
            tableView?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 5).isActive = true
            tableView?.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
            tableView?.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        }
    }

    @objc func fetchData() {
        ApiManager.shared.getData(with: appUrl) { (countryData, error) in
            self.refreshControl?.endRefreshing()
            if error != nil {
                return
            }
            guard let countryData = countryData else {return}
            self.countryData = countryData
        }
    }

    func updateView() {
        self.title = self.countryViewModel?.title
        self.tableView?.reloadData()
    }
}
