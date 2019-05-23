//
//  DetailCell.swift
//  Roshan_POC
//
//  Created by Roshan Dharpure on 16/05/19.
//  Copyright © 2019 Roshan Dharpure. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {
    var contentBackgroundView: UIView!
    var lblTitle: UILabel!
    var lblDescription: UILabel!
    var imgRefrenceView: UIImageView!
    var countryDetailViewModel: CountryDetailViewModel? {
        didSet {
            lblTitle.text = countryDetailViewModel?.titleText
            lblDescription.attributedText = countryDetailViewModel?.descriptionText
            imgRefrenceView.pin_updateWithProgress = true
            imgRefrenceView.pin_setPlaceholder(with: UIImage.init(named: placeholderImage))
            if let url = countryDetailViewModel?.imageUrl {
                imgRefrenceView.pin_setImage(from: url, completion: { (result) in
                    self.layoutIfNeeded()
                })
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupSubviews() {

        //Content Background View
        contentBackgroundView = UIView.init(frame: .zero)
        contentView.addSubview(contentBackgroundView)

        //Title Label
        lblTitle = UILabel(frame: .zero)
        lblTitle.font = UIFont.boldSystemFont(ofSize: 22.0)
        lblTitle.textColor = UIColor.black
        lblTitle.numberOfLines = 0
        lblTitle.clipsToBounds = true
        contentBackgroundView.addSubview(lblTitle)

        //ImageView
        imgRefrenceView = UIImageView.init(frame: .zero)
        imgRefrenceView.clipsToBounds = true
        imgRefrenceView?.contentMode = .scaleAspectFit
        imgRefrenceView?.image = UIImage.init(named: placeholderImage)
        contentBackgroundView.addSubview(imgRefrenceView)

        //Description Label
        lblDescription = UILabel(frame: .zero)
        lblDescription.clipsToBounds = true
        lblDescription.numberOfLines = 0
        contentBackgroundView.addSubview(lblDescription)
        self.setupLayout()

    }

    func setupLayout() {

        //Disable Autoresizing mask
        contentBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblDescription.translatesAutoresizingMaskIntoConstraints = false
        imgRefrenceView.translatesAutoresizingMaskIntoConstraints = false

        // Add constraints for self sizing the cells
        NSLayoutConstraint.activate([
            contentBackgroundView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5.0),
            contentBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5.0),
            contentBackgroundView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5.0),
            contentBackgroundView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5.0),

            lblTitle.heightAnchor.constraint(equalToConstant: 30.0),

            lblTitle.topAnchor.constraint(equalTo: contentBackgroundView.topAnchor, constant: 5.0),
            lblTitle.bottomAnchor.constraint(equalTo: self.imgRefrenceView.topAnchor, constant: -10.0),
            lblTitle.leadingAnchor.constraint(equalTo: contentBackgroundView.leadingAnchor, constant: 0.0),
            lblTitle.trailingAnchor.constraint(equalTo: contentBackgroundView.trailingAnchor, constant: 0.0),

            imgRefrenceView.leadingAnchor.constraint(equalTo: lblTitle.leadingAnchor),
            imgRefrenceView.trailingAnchor.constraint(equalTo: lblTitle.trailingAnchor),
            imgRefrenceView.bottomAnchor.constraint(equalTo: self.lblDescription.topAnchor, constant: -10.0),

            lblDescription.leadingAnchor.constraint(equalTo: lblTitle.leadingAnchor),
            lblDescription.trailingAnchor.constraint(equalTo: lblTitle.trailingAnchor),

            lblDescription.bottomAnchor.constraint(equalTo: contentBackgroundView.bottomAnchor, constant: -10.0),
            ])

    }

}
