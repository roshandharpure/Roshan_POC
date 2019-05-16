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
        
        //Card view
        cardView = UIView.init(frame: self.contentView.bounds)
        self.contentView.addSubview(cardView!)
        cardView?.layer.cornerRadius = 2.0
        cardView?.layer.shadowColor = UIColor.gray as! CGColor
        cardView?.layer.shadowOffset = CGSize.init(width: 0.3, height: 0.3)
        cardView?.layer.masksToBounds = false
        
        //Title Label
        lblTitle = UILabel(frame: contentView.bounds)
        lblTitle.font = UIFont.systemFont(ofSize: 20.0)
        lblTitle.numberOfLines = 0
        contentView.addSubview(lblTitle)
        
        //Refrence ImageView
        imgRefrenceView = UIImageView.init(frame: contentView.bounds)
        imgRefrenceView?.contentMode = .scaleAspectFit
        imgRefrenceView?.image = UIImage.init(named:PLACEHOLDER_IMAGE)
        contentView.addSubview(imgRefrenceView)
        
        //Description Label
        lblDescription = UILabel(frame: contentView.bounds)
        lblDescription.font = UIFont.systemFont(ofSize: 17.0)
        lblDescription.numberOfLines = 0
        contentView.addSubview(lblDescription)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setupLayout()
        
        
    }
    
    func setupLayout(){
        //Layout
        cardView?.translatesAutoresizingMaskIntoConstraints = false
        cardView?.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5.0).isActive = true
        cardView?.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 10.0).isActive = true
        cardView?.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5.0).isActive = true
        cardView?.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 5.0).isActive = true
        
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.heightAnchor.constraint(equalToConstant: 50.0)
        lblTitle.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10.0).isActive = true
        lblTitle.bottomAnchor.constraint(equalTo: self.imgRefrenceView.topAnchor, constant: 10.0).isActive = true
        lblTitle.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10.0).isActive = true
        lblTitle.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10.0).isActive = true
        
        imgRefrenceView.leadingAnchor.constraint(equalTo: lblTitle.leadingAnchor).isActive = true
        imgRefrenceView.trailingAnchor.constraint(equalTo: lblTitle.trailingAnchor).isActive = true
        imgRefrenceView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imgRefrenceView.bottomAnchor.constraint(equalTo: self.lblDescription.topAnchor, constant: 10.0).isActive = true
        imgRefrenceView.translatesAutoresizingMaskIntoConstraints = false

        lblDescription.leadingAnchor.constraint(equalTo: lblTitle.leadingAnchor).isActive = true
        lblDescription.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        lblDescription.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 10.0).isActive = true
        lblDescription.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    //Download Image asynchronously
    func downloadImage(with url:String, completion:@escaping (Data?,Error?) -> Void){
       // DispatchQueue.async(DispatchQueue)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
