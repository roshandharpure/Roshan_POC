//
//  ApiManager.swift
//  Roshan_POC
//
//  Created by Roshan Dharpure on 16/05/19.
//  Copyright © 2019 Roshan Dharpure. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD

class ApiManager: NSObject {

    static let shared = ApiManager()

    func getData(with url: String, completion:@escaping (_ data: Country?, _ error: Error?)-> Void) {

        Alamofire.request(url).responseData { (responseData) in
            SVProgressHUD.dismiss()
            switch responseData.result {
            case .success(let data):

                //Apply string encoding as response is not UTF 8 formatted
                let string = String(decoding: data, as: UTF8.self)
                if let datastr = string.data(using: String.Encoding.utf8) {
                    //Map response data into model
                    do {
                        let countryData = try JSONDecoder().decode(Country.self, from: datastr)
                        completion(countryData, nil)
                    } catch let error as NSError {
                        print(error)
                        completion(nil, error)
                    }
                }
            case .failure(let error):
                completion(nil, error)
                SVProgressHUD.showError(withStatus: "Something went wrong")
            }
        }

    }

}
