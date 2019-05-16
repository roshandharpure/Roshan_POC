//
//  CountryViewModel.swift
//  Roshan_POC
//
//  Created by Roshan Dharpure on 16/05/19.
//  Copyright © 2019 Roshan Dharpure. All rights reserved.
//

import UIKit

class CountryViewModel: NSObject {
    var countryData:Country?
    
    var title:String?{
        return countryData?.title
    }
    
    var details:[CountryDetails]?{
        return countryData?.details
    }
    
    init(country:Country?) {
        self.countryData = country
    }
    
    func fetchCountryDetails(completionHandler: @escaping (Country?,Error?)->Void ){
        ApiManager.shared.getData(with:BASIC_URL) { (countryData, error) in
            
            completionHandler(countryData, error)
        }
        
    }
}
