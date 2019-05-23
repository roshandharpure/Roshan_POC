//
//  CountryViewModel.swift
//  Roshan_POC
//
//  Created by Roshan Dharpure on 16/05/19.
//  Copyright © 2019 Roshan Dharpure. All rights reserved.
//

import UIKit

class CountryViewModel: NSObject {
    var countryData: Country?
    var title: String? {
        return countryData?.title ?? "NA"
    }

    var details: [CountryDetails]? {
        return countryData?.details ?? []
    }

    init(country: Country?) {
        self.countryData = country
    }

}
