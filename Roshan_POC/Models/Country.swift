//
//  Country.swift
//  Roshan_POC
//
//  Created by Roshan Dharpure on 16/05/19.
//  Copyright © 2019 Roshan Dharpure. All rights reserved.
//

import Foundation

struct Country: Codable {
    var title: String?
    var details: [CountryDetails]?
    enum CodingKeys: String, CodingKey {
        case title
        case details = "rows"
    }
}
