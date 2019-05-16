//
//  DetailCell.swift
//  Roshan_POC
//
//  Created by Roshan Dharpure on 16/05/19.
//  Copyright © 2019 Roshan Dharpure. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {
    var lblTitle:UILabel!
    var lblDescription:UILabel!
    var imgRefrenceView: UIImageView!
    var cardView:UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // setupSubviews()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews(){
        self.translatesAutoresizingMaskIntoConstraints = false
        //Title Label
        lblTitle = UILabel(frame: contentView.bounds)
        lblTitle.font = UIFont.systemFont(ofSize: 20.0)
        lblTitle.numberOfLines = 0
        lblTitle.clipsToBounds = true
        contentView.addSubview(lblTitle)
        
        // ImageView
        imgRefrenceView = UIImageView.init(frame: contentView.bounds)
        imgRefrenceView.clipsToBounds = true
        imgRefrenceView?.contentMode = .scaleAspectFill
        imgRefrenceView?.image = UIImage.init(named:PLACEHOLDER_IMAGE)
        contentView.addSubview(imgRefrenceView)
        
        //Description Label
        lblDescription = UILabel(frame: contentView.bounds)
        lblDescription.clipsToBounds = true
        lblDescription.font = UIFont.systemFont(ofSize: 17.0)
        lblDescription.numberOfLines = 0
        contentView.addSubview(lblDescription)
        self.setupLayout()
        
        
    }
    
    func setupLayout(){
        //Layout
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblDescription.translatesAutoresizingMaskIntoConstraints = false
        imgRefrenceView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lblTitle.heightAnchor.constraint(equalToConstant: 50.0),
            lblTitle.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10.0),
            lblTitle.bottomAnchor.constraint(equalTo: self.imgRefrenceView.topAnchor, constant: 10.0),
            lblTitle.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10.0),
            lblTitle.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 10.0),
            
            imgRefrenceView.leadingAnchor.constraint(equalTo: lblTitle.leadingAnchor),
            imgRefrenceView.trailingAnchor.constraint(equalTo: lblTitle.trailingAnchor),
            imgRefrenceView.heightAnchor.constraint(equalToConstant: self.contentView.frame.width),
            imgRefrenceView.bottomAnchor.constraint(equalTo: self.lblDescription.topAnchor, constant: 10.0),
            
            lblDescription.leadingAnchor.constraint(equalTo: lblTitle.leadingAnchor),
            lblDescription.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            lblDescription.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 10.0),
            ])

    }
    
    override func layoutSubviews() {
        self.contentView.layoutIfNeeded()
        self.contentView.layoutSubviews()
    }

}
