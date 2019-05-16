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
        setupSubviews()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       // setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews(){
        
        //Title label
        lblTitle = UILabel(frame: contentView.bounds)
        lblTitle.font = UIFont.systemFont(ofSize: 20.0)
        lblTitle.numberOfLines = 0
        lblTitle.text = "\(1)"
        contentView.addSubview(lblTitle)
        
        //Refrence ImageView
        imgRefrenceView = UIImageView.init(frame: contentView.bounds)
        imgRefrenceView?.contentMode = .scaleAspectFit
        contentView.addSubview(imgRefrenceView)
        
        //Description Label
        lblDescription = UILabel(frame: contentView.bounds)
        lblDescription.font = UIFont.systemFont(ofSize: 17.0)
        lblDescription.numberOfLines = 0
        lblDescription.text = "\(2)"
        contentView.addSubview(lblDescription)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setupLayout()
        
        
    }
    
    func setupLayout(){
        //Layout
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10.0).isActive = true
        lblTitle.bottomAnchor.constraint(equalTo: self.imgRefrenceView.topAnchor, constant: 10.0).isActive = true
        lblTitle.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10.0).isActive = true
        lblTitle.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 10.0).isActive = true
        
        imgRefrenceView.leftAnchor.constraint(equalTo: lblTitle.leftAnchor).isActive = true
        imgRefrenceView.rightAnchor.constraint(equalTo: lblTitle.rightAnchor).isActive = true
        imgRefrenceView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imgRefrenceView.bottomAnchor.constraint(equalTo: self.lblDescription.topAnchor, constant: 10.0).isActive = true
        imgRefrenceView.translatesAutoresizingMaskIntoConstraints = false

        lblDescription.leftAnchor.constraint(equalTo: lblTitle.leftAnchor).isActive = true
        lblDescription.rightAnchor.constraint(equalTo: lblTitle.rightAnchor).isActive = true
        lblDescription.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 10.0).isActive = true
        lblDescription.translatesAutoresizingMaskIntoConstraints = false
    
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
