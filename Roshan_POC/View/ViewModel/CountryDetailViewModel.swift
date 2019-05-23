//
//  CountryDetailViewModel.swift
//  Roshan_POC
//
//  Created by Roshan Dharpure on 22/05/19.
//  Copyright © 2019 Roshan Dharpure. All rights reserved.
//

import UIKit

class CountryDetailViewModel: NSObject {
    var countryDetail: CountryDetails?

    var titleText: String {
        return countryDetail?.title ?? "NA"
    }

    var descriptionText: NSAttributedString {
        let descriptionString = countryDetail?.description ?? "NA"
        let attributes: [NSAttributedStringKey: Any] = [ .font: UIFont.systemFont(ofSize: 18.0), .foregroundColor: UIColor.black]

        let descriptionAttributedString =  NSMutableAttributedString.init(string: descriptionString, attributes: attributes)

        return descriptionAttributedString

    }

    var imageUrl: URL? {
        if let imgRefUrl = countryDetail?.imageHref {
            if let url = URL.init(string: imgRefUrl) {
                return url
            }
        }
        return nil
    }

    init(countryDetails: CountryDetails?) {
        self.countryDetail = countryDetails
    }
}
