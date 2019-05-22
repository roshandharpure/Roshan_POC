//
//  CountryDetails.swift
//  Roshan_POC
//
//  Created by Roshan Dharpure on 16/05/19.
//  Copyright © 2019 Roshan Dharpure. All rights reserved.
//

import Foundation

struct CountryDetails: Codable {
    var title: String?
    var description: String?
    var imageHref: String?
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case imageHref
    }
}
