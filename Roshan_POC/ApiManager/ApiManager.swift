//
//  ApiManager.swift
//  Roshan_POC
//
//  Created by Roshan Dharpure on 16/05/19.
//  Copyright © 2019 Roshan Dharpure. All rights reserved.
//

import Foundation
import Alamofire

class ApiManager: NSObject{
    
    static let shared = ApiManager()
    
    func getData(with url:String, completion:@escaping (_ data:Country?, _ error:Error?)-> Void){
        
        Alamofire.request(url).responseData { (responseData) in
            switch responseData.result{
            case .success(let data):
                let countryData = try? JSONDecoder().decode(Country.self, from: data)
                do {
                    //Apply string encoding as response is not UTF 8 formatted
                    if let string = String(decoding: data, as: UTF8.self) as? String,
                        let datastr = string.data(using: String.Encoding.utf8) as? Data{
                        //Map response data into model
                        let countryData = try? JSONDecoder().decode(Country.self, from: datastr)
                        print(countryData?.title ?? "")
                        completion(countryData,nil)
                    }
                    
                } catch let error as NSError {
                    print(error)
                    completion(nil,error)
                }
                
            case .failure(let error):
                completion(nil,error)
            }
        }
       
    }
    
    
}
